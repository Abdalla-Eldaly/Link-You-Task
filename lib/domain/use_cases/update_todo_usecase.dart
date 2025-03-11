import 'package:injectable/injectable.dart';
import 'package:linkyou_task/data/network/result.dart';
import 'package:linkyou_task/data/models/responses/tasks_response/tasks.dart';
import 'package:linkyou_task/domain/repository/repository.dart';

@injectable
class UpdateToDoUseCase {
  final Repository _repository;

  UpdateToDoUseCase(this._repository);

  Future<Result<Todos?>> call(int id, bool isCompleted,String todo) {
    return _repository.updateTaskStatus(id, isCompleted,todo);
  }
}
