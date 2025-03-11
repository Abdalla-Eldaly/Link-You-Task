import 'package:linkyou_task/data/models/responses/login_response/Login_respones.dart';
import '../../domain/models/user_model.dart';

class UserDto {
  static User toEntity(LoginResponse userResponse) {
    return User(
      accessToken: userResponse.accessToken,
      refreshToken: userResponse.refreshToken,
      id: userResponse.id,
      username: userResponse.username,
      email: userResponse.email,
      firstName: userResponse.firstName,
      lastName: userResponse.lastName,
      gender: userResponse.gender,
      image: userResponse.image,
    );
  }
}
