
import 'package:injectable/injectable.dart';
import 'package:linkyou_task/data/models/requests/login_request/login_request.dart';
import 'package:linkyou_task/data/models/responses/tasks_response/tasks_response.dart';
import 'package:linkyou_task/domain/repository/repository.dart';

import '../../core/providers/user_provider.dart';
import '../../domain/models/user_model.dart';
import '../contracts/offline_data_source.dart';
import '../contracts/online_data_source.dart';
import '../models/responses/login_response/Login_respones.dart';
import '../models/responses/tasks_response/tasks.dart';
import '../network/result.dart';

@Injectable(as: Repository)
class RepositoryImpl implements Repository {
  final OnlineDataSource _remoteDataSource;
  final OfflineDataSource _offlineDataSource;
  RepositoryImpl(this._remoteDataSource, this._offlineDataSource,);
  @override
  Future<Result<LoginResponse?>> login(LoginRequest request) async {
    final result = await _remoteDataSource.login(request);
    switch (result) {
      case Success<LoginResponse?>():
        UserProvider().login(result.data!.accessToken!);
        return result;
      case Fail<LoginResponse?>():
        return result;
    }
  }
  @override
   Future<Result<String?>> checkCachedUser() async {
     final result = await _offlineDataSource.checkUser();
     switch (result) {
       case Success<String?>():
         if (result.data != null) {
           UserProvider().login(result.data!);
         }
         return result;
       case Fail<String?>():
         return result;
     }
   }

   @override
   Future<Result<User>> getCachedUser() async {
     final result = await _offlineDataSource.getUser();
     switch (result) {
       case Success<User>():
         UserProvider().setUser(result.data!);
         return result;
       case Fail<User>():
         return result;
     }
   }

   @override
   Future<Result<bool>> setCachedUser(User user, String token) async {
     final result = await _offlineDataSource.setUser(user, token);
     return result;
   }

  @override
  Future<Result<TodoResponse?>> getToDo({required int limit, required int skip}) async {
    final result = await _remoteDataSource.getToDo(limit: limit, skip: skip);

    if (result is Success<TodoResponse?>) {
      await _offlineDataSource.cacheTodos(result.data?.todos ?? []);
      return result;
    } else if (result is Fail) {
      final cachedTasks = await _offlineDataSource.getCachedTodos();
      if (cachedTasks.isNotEmpty) {
        return Success(TodoResponse(todos: cachedTasks));
      }
    }
    return result;
  }
  @override
  Future<Result<Todos?>> updateTaskStatus(int id, bool isCompleted,String todo)async {
    final result = await _remoteDataSource.updateTaskStatus(id ,isCompleted ,todo);
    return result;
  }

  @override
  Future<Result<Todos?>> deleteTask(int id) async{
    final result = await _remoteDataSource.deleteTask(id  );
    return result;
  }

}