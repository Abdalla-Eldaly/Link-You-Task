
import 'package:injectable/injectable.dart';
import 'package:linkyou_task/data/models/responses/tasks_response/tasks_response.dart';
import 'package:linkyou_task/domain/repository/repository.dart';

import '../../data/network/result.dart';

@injectable
class GetToDoUseCase {
  final Repository _repository;

  GetToDoUseCase(this._repository);

  Future<Result<TodoResponse?>> getToDo({required int limit, required int skip}) async {
    return await _repository.getToDo(limit: limit, skip: skip);
  }
}
