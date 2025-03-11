import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkyou_task/core/common/validator/validator.dart';
import 'package:linkyou_task/presentaion/login_screen/view_model/login_view_model.dart';
import 'package:linkyou_task/data/models/requests/login_request/login_request.dart';
import 'package:linkyou_task/presentaion/resources/color_manager.dart';
import 'package:linkyou_task/presentaion/resources/strings_manager.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/common/widgets/custom_textField.dart';
import '../../../resources/text_style.dart';

class LoginScreenBody extends StatelessWidget {
  final LoginViewModel viewModel;
  static final _formKey = GlobalKey<FormState>();

  const LoginScreenBody({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorManager.white, ColorManager.lightBlue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 100,
                  child: Text(
                    StringsManager.appName.tr(),
                    style: AppTextStyles.headlineMedium.copyWith(
                      color: ColorManager.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 20),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          StringsManager.welcomeBack,
                          style: AppTextStyles.headlineSmall.copyWith(
                            color: ColorManager.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 10),

                        Text(
                          StringsManager.enterCredentials.tr(),
                          style: AppTextStyles.bodyMedium,
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 30),

                        /// 🔹 **Username Field**
                        CustomTextField(
                          controller: viewModel.getUserNameController,
                          label: StringsManager.username.tr(),
                          icon: Icons.person,
                          validator: AppValidators.validateUsername,
                        ),

                        const SizedBox(height: 15),

                        /// 🔹 **Password Field**
                        CustomTextField(
                          controller: viewModel.getPasswordController,
                          label: StringsManager.password.tr(),
                          icon: Icons.lock,
                          isPassword: true,
                          validator: AppValidators.validatePassword,
                        ),

                        const SizedBox(height: 10),

                        /// 🔹 **Forgot Password**
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // TODO: Navigate to Forgot Password Screen
                            },
                            child: Text(
                              StringsManager.forgotPassword.tr(),
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: ColorManager.primary,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        CustomButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final request = LoginRequest(
                                username: viewModel.getUserNameController.text.trim(),
                                password: viewModel.getPasswordController.text.trim(),
                              );
                              viewModel.login(request,context);
                            }
                          },
                          text: StringsManager.login.tr(),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringsManager.dontHaveAccount.tr(),
                      style: AppTextStyles.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: Navigate to Sign Up Screen
                      },
                      child: Text(
                        StringsManager.signUp.tr(),
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: ColorManager.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
