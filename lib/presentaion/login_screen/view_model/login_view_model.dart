import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:linkyou_task/data/models/requests/login_request/login_request.dart';
import 'package:linkyou_task/data/models/responses/login_response/Login_respones.dart';
import 'package:linkyou_task/domain/use_cases/login_use_case.dart';
import 'package:provider/provider.dart';
import '../../../core/providers/user_provider.dart';
import '../../../core/routes/app_routes.dart';
import '../../../data/dtos/user_dto.dart';
import '../../../data/network/result.dart';
import '../../../domain/use_cases/check_cached_user_use_case.dart';
import '../../../domain/use_cases/get_cached_user_use_case.dart';
import '../../../domain/use_cases/set_cached_user_use_case.dart';
import '../../base/base_cubit.dart';
import '../../base/base_states.dart';
import '../../resources/strings_manager.dart';
import '../../../domain/models/user_model.dart';

@injectable
class LoginViewModel extends BaseCubit implements LoginViewModelOutput {
  final LoginUseCase _loginUseCase;
  final SetCachedUserUseCase _setCachedUserUseCase;
  final CheckCachedUserUseCase _checkCachedUserUseCase;
  final GetCachedUserUseCase _getCachedUserUseCase;

  LoginViewModel(
      this._loginUseCase,
      this._setCachedUserUseCase,
      this._checkCachedUserUseCase,
      this._getCachedUserUseCase,
      );

  static LoginViewModel get(BuildContext context) => BlocProvider.of<LoginViewModel>(context);

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void start(context) {
    checkCachedUser(context);
  }



  bool isCheckingCache = true;



  Future<void> checkCachedUser(BuildContext context) async {
    isCheckingCache = true;
    emit(LoadingState());

    final result = await _checkCachedUserUseCase.checkUser();

    if (result is Success<String?> && result.data != null) {
      final userResult = await _getCachedUserUseCase.getUser();

      if (userResult is Success<User>) {
        final userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.login(result.data!);
        userProvider.setUser(userResult.data!);

        emit(AutoLoginSuccessState());
        return;
      }
    }

    isCheckingCache = false;
    emit(InitialState());
  }

  Future<void> login(LoginRequest request, BuildContext context) async {
    emit(LoadingState());

    final result = await _loginUseCase.login(request);

    if (result is Success<LoginResponse?>) {
      final userResponse = result.data;

      if (userResponse != null && userResponse.accessToken != null) {
        final userEntity = UserDto.toEntity(userResponse);

        final cacheResult = await _setCachedUserUseCase.setUser(userEntity, userResponse.accessToken!);

        if (cacheResult is Success<bool>) {
          final userProvider = Provider.of<UserProvider>(context, listen: false);
          userProvider.login(userResponse.accessToken!);
          userProvider.setUser(userEntity);

          emit(SuccessState(StringsManager.loginSuccess));
        } else {
          emit(ErrorState("Failed to cache user data"));
        }
      } else {
        emit(ErrorState("Invalid response data"));
      }
    } else if (result is Fail<LoginResponse?>) {
      emit(ErrorState(StringsManager.invalidCredentials));
    }
  }

  @override
  TextEditingController get getUserNameController => _userNameController;

  @override
  TextEditingController get getPasswordController => _passwordController;
}

abstract class LoginViewModelOutput {
  TextEditingController get getUserNameController;
  TextEditingController get getPasswordController;
}

class AutoLoginSuccessState extends BaseState{}