
import 'package:injectable/injectable.dart';
import 'package:linkyou_task/data/models/requests/login_request/login_request.dart';
import 'package:linkyou_task/domain/repository/repository.dart';

import '../../data/models/responses/login_response/Login_respones.dart';
import '../../data/network/result.dart';

@injectable
class LoginUseCase {
  final Repository _loginRepo;
  LoginUseCase(this._loginRepo);
  Future<Result<LoginResponse?>> login(LoginRequest request) async {
    return await _loginRepo.login(request);
  }
}