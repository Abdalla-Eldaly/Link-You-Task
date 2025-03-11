import 'package:linkyou_task/data/models/requests/login_request/login_request.dart';
import 'package:linkyou_task/data/models/responses/tasks_response/tasks_response.dart';

import '../../data/models/responses/login_response/Login_respones.dart';
import '../../data/models/responses/tasks_response/tasks.dart';
import '../../data/network/result.dart';
import '../models/user_model.dart';

abstract class Repository {
  Future<Result<LoginResponse?>> login(LoginRequest request);
   Future<Result<String?>> checkCachedUser();
   Future<Result<User>> getCachedUser();
   Future<Result<bool>> setCachedUser(User user, String token);
  Future<Result<TodoResponse?>> getToDo({required int limit, required int skip});
  Future<Result<Todos?>> updateTaskStatus(int id, bool isCompleted,String todo);
  Future<Result<Todos?>> deleteTask(int id);
}