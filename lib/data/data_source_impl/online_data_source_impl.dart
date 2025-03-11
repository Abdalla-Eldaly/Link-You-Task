import 'package:injectable/injectable.dart';

import '../../domain/models/user_model.dart';
import '../contracts/online_data_source.dart';
import '../dtos/user_dto.dart';
import '../models/requests/login_request/login_request.dart';
import '../models/responses/login_response/Login_respones.dart';
import '../models/responses/tasks_response/tasks.dart';
import '../models/responses/tasks_response/tasks_response.dart';
import '../network/api_execution.dart';
import '../network/api_manager.dart';
import '../network/result.dart';

@Injectable(as: OnlineDataSource)
class OnlineDataSourceImpl implements OnlineDataSource {
  final ApiManager _apiManager;
  OnlineDataSourceImpl(this._apiManager);
  @override
  Future<Result<LoginResponse?>> login(LoginRequest request) {
    return executeApi(() async {
      final result = await _apiManager.login(request);
      return result;
    });
  }

  @override
  Future<Result<TodoResponse?>> getToDo({required int limit, required int skip}) {
    return executeApi(() async {
      final result = await _apiManager.getToDo(limit: limit, skip: skip);
      return result;
    });
  }

  @override
  Future<Result<Todos?>> updateTaskStatus(int id, bool isCompleted,String todo) {
    return executeApi(() async {
      final result = await _apiManager.updateTaskStatus(id, isCompleted,todo);
      return result;
    });
  }

  @override
  Future<Result<Todos?>> deleteTask(int id) {
    return executeApi(() async {
      final result = await _apiManager.deleteTask(id);
      return result;
    });
  }

  // @override
  // Future<Result<User>> getUserData() {
  //   return executeApi(() async {
  //     final result = await _apiManager.getUserData();
  //     return UserDto.toEntity(result);
  //   });
  // }
}