

import '../../domain/models/user_model.dart';
import '../models/responses/tasks_response/tasks.dart';
import '../network/result.dart';

abstract class OfflineDataSource {
  Future<Result<String?>> checkUser();
  Future<Result<bool>> setUser(User user, String token);
  Future<Result<User>> getUser();

  Future<List<Todos>> getCachedTodos();
  Future<void> cacheTodos(List<Todos> todos);

}