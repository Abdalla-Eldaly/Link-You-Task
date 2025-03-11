import 'package:linkyou_task/data/models/requests/login_request/login_request.dart';
import 'package:linkyou_task/data/models/responses/tasks_response/tasks_response.dart';

import '../../domain/models/user_model.dart';
import '../models/responses/login_response/Login_respones.dart';
import '../models/responses/tasks_response/tasks.dart';
import '../network/result.dart';

abstract class OnlineDataSource {
  Future<Result<LoginResponse?>> login(LoginRequest request);

  Future<Result<TodoResponse?>> getToDo({required int limit, required int skip});
  Future<Result<Todos?>> updateTaskStatus(int id, bool isCompleted,String todo);
  Future<Result<Todos?>> deleteTask(int id);
}