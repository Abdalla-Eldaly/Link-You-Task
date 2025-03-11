import 'package:linkyou_task/presentaion/resources/strings_manager.dart';

class AppValidators {
  AppValidators._();



  static String? validatePassword(String? val) {
    // RegExp passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
    if (val == null) {
      return StringsManager.validationsFieldRequired;
    } else if (val.isEmpty) {
      return StringsManager.validationsFieldRequired;
    } else if (val.length < 5 ) {
      return StringsManager.validationsPasswordSpecifications;
    } else {
      return null;
    }
  }



  static String? validateUsername(String? val) {
    RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (val == null) {
      return StringsManager.validationsFieldRequired;
    } else if (val.isEmpty) {
      return StringsManager.validationsFieldRequired;
    } else if (!usernameRegex.hasMatch(val)) {
      return StringsManager.validationsUsername;
    } else {
      return null;
    }
  }



}