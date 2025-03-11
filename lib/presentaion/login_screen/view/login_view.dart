import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:linkyou_task/presentaion/login_screen/view/widgets/login_screen_body.dart';
import 'package:linkyou_task/presentaion/login_screen/view_model/login_view_model.dart';
import '../../../../../../core/di/di.dart';
import '../../../core/routes/app_routes.dart';
import '../../base/base_states.dart';
import '../../base/cubit_builder.dart';
import '../../base/cubit_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GetIt.I<LoginViewModel>()..start(context),
        child: BlocConsumer<LoginViewModel, BaseState>(
          listener: (context, state) {
            if (state is AutoLoginSuccessState) {
              Navigator.pushReplacementNamed(context, AppRoutes.homeScreenRoute);
            }
            if (state is SuccessState) {
              Navigator.pushReplacementNamed(context, AppRoutes.homeScreenRoute);
            }
            if (state is ErrorState) {
              Navigator.pop(context);
            }
            return baseListener(context, state);
          },
          builder: (context, state) {
            final viewModel = LoginViewModel.get(context);

            if (viewModel.isCheckingCache) {
              return Center(child: CircularProgressIndicator());
            }

            return baseBuilder(context, state,
                LoginScreenBody(viewModel: viewModel));
          },
        ),
      ),
    );
  }
}
