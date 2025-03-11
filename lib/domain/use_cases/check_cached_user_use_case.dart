
import 'package:injectable/injectable.dart';
import 'package:linkyou_task/domain/repository/repository.dart';

import '../../data/network/result.dart';

@injectable
class CheckCachedUserUseCase {
  final Repository _loginRepo;
  CheckCachedUserUseCase(this._loginRepo);

  Future<Result<String?>> checkUser() async {
    return await _loginRepo.checkCachedUser();
  }
}