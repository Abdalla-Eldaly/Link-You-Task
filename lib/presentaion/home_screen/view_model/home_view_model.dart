import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:linkyou_task/data/models/responses/tasks_response/tasks.dart';
import 'package:linkyou_task/data/models/responses/tasks_response/tasks_response.dart';
import 'package:linkyou_task/domain/use_cases/get_todo_usecase.dart';
import 'package:linkyou_task/domain/use_cases/update_todo_usecase.dart';
import 'package:linkyou_task/domain/use_cases/delete_todo_usecase.dart';
import 'package:linkyou_task/presentaion/base/base_cubit.dart';
import '../../../data/network/result.dart';
import '../../base/base_states.dart';

@injectable
class HomeViewModel extends BaseCubit {
  final GetToDoUseCase _getToDoUseCase;
  final UpdateToDoUseCase _updateToDoUseCase;
  final DeleteToDoUseCase _deleteToDoUseCase;

  static HomeViewModel get(BuildContext context) => BlocProvider.of<HomeViewModel>(context);

  List<Todos> todos = [];
  bool isLoadingMore = false;
  bool hasMoreData = true;
  int limit = 10;
  int skip = 0;

  HomeViewModel(this._getToDoUseCase, this._updateToDoUseCase, this._deleteToDoUseCase);

  @override
  void start(BuildContext context) {
    fetchToDo(isFirstLoad: true);
  }

  Future<void> fetchToDo({bool isFirstLoad = false}) async {
    if (isFirstLoad) {
      skip = 0;
      hasMoreData = true;
    } else {
      if (isLoadingMore || !hasMoreData) return;
      isLoadingMore = true;
      emit(ContentState());
    }

    final result = await _getToDoUseCase.getToDo(limit: limit, skip: skip);

    if (result is Success<TodoResponse?>) {
      final response = result.data?.todos ?? [];

      if (isFirstLoad) {
        todos = response;
      } else {
        todos.addAll(response);
      }

      if (response.length < limit) {
        hasMoreData = false;
      } else {
        skip += limit;
      }

      emit(ContentState());
    } else if (result is Fail) {
      emitError(errorMessage: 'Something went wrong');
    }

    isLoadingMore = false;
  }

  Future<void> updateTaskStatus(int id, bool isCompleted,String todo) async {
    final result = await _updateToDoUseCase(id, isCompleted,todo);
    if (result is Success<Todos?>) {
      final index = todos.indexWhere((task) => task.id == id);
      if (index != -1) {
        todos[index] = result.data!;
        emit(ContentState());
      }
    } else {
      emitError(errorMessage: 'Failed to update task');
    }
  }

  Future<void> deleteTask(int id) async {
    final result = await _deleteToDoUseCase(id);
    if (result is Success<Todos?>) {
      todos.removeWhere((task) => task.id == id);
      emit(ContentState());
    } else {
      emitError(errorMessage: 'Failed to delete task');
    }
  }


  Future<void> editTask(int id, String newTaskName) async {
    final result = await _updateToDoUseCase(id, false, newTaskName);
    if (result is Success<Todos?>) {
      final index = todos.indexWhere((task) => task.id == id);
      if (index != -1) {
        todos[index] = result.data!;
        emit(ContentState());
      }
    } else {
      emitError(errorMessage: 'Failed to edit task');
    }
  }

  Future<void> toggleTaskComplete(int id, bool isCompleted, String todo) async {
    final result = await _updateToDoUseCase(id, isCompleted, todo);
    if (result is Success<Todos?>) {
      final index = todos.indexWhere((task) => task.id == id);
      if (index != -1) {
        todos[index] = result.data!;
        emit(ContentState());
      }
    } else {
      emitError(errorMessage: 'Failed to update task status');
    }
  }

}
