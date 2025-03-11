import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:linkyou_task/data/models/requests/login_request/login_request.dart';
import 'package:linkyou_task/data/models/responses/tasks_response/tasks_response.dart';
import '../models/responses/login_response/Login_respones.dart';
import '../models/responses/tasks_response/tasks.dart';
import 'api_constants.dart';

@singleton
@injectable
class ApiManager {
  final Dio _dio;

  ApiManager(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    ));
  }

  /// Login API
  Future<LoginResponse> login(LoginRequest request) async {
    final response = await _dio.post(
      ApiConstants.loginPath,
      data: request.toJson(),
    );
    return LoginResponse.fromJson(response.data);
  }

  Future<TodoResponse> getToDo({required int limit, required int skip}) async {
    final response = await _dio.get(
      ApiConstants.todoPath,
      queryParameters: {
        "limit": limit,
        "skip": skip,
      },
    );
    return TodoResponse.fromJson(response.data);
  }
  Future<Todos> updateTaskStatus(int id, bool? isCompleted,String? todo) async {
    final response = await _dio.put(
      "${ApiConstants.todoPath}/$id",
      data: {
        "completed": isCompleted,
        "todo": todo},
    );
    return Todos.fromJson(response.data);
  }

  Future<Todos> deleteTask(int id) async {
    final response = await _dio.delete("${ApiConstants.todoPath}/$id");
    return Todos.fromJson(response.data);
  }

}
