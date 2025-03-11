
import 'package:injectable/injectable.dart';
import 'package:linkyou_task/data/models/responses/login_response/Login_respones.dart';
import 'package:linkyou_task/domain/repository/repository.dart';

import '../../data/network/result.dart';
import '../models/user_model.dart';

@injectable
class GetCachedUserUseCase {
  final Repository _loginRepo;
  GetCachedUserUseCase(this._loginRepo);

  Future<Result<User>> getUser() async {
    return await _loginRepo.getCachedUser();
  }
}