import 'package:injectable/injectable.dart';
import 'package:linkyou_task/data/network/result.dart';
import 'package:linkyou_task/data/models/responses/tasks_response/tasks.dart';
import 'package:linkyou_task/domain/repository/repository.dart';

@injectable
class DeleteToDoUseCase {
  final Repository _repository;

  DeleteToDoUseCase(this._repository);

  Future<Result<Todos?>> call(int id) {
    return _repository.deleteTask(id);
  }
}
