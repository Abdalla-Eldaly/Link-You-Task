
import 'package:injectable/injectable.dart';
import 'package:linkyou_task/domain/repository/repository.dart';

import '../../data/network/result.dart';
import '../models/user_model.dart';

@injectable
class SetCachedUserUseCase {
  final Repository _loginRepo;
  SetCachedUserUseCase(this._loginRepo);

  Future<Result<bool?>> setUser(User user, String token) async {
    return await _loginRepo.setCachedUser(user, token);
  }
}