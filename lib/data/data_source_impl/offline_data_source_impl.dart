
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../core/local/hive/hive_execution.dart';
import '../../core/local/hive/hive_manager.dart';
import '../../domain/models/user_model.dart';
import '../contracts/offline_data_source.dart';
import '../dtos/hive_user_dto.dart';
import '../models/responses/tasks_response/tasks.dart';
import '../network/result.dart';

@Injectable(as: OfflineDataSource)
class OfflineDataSourceImpl implements OfflineDataSource {
  final HiveManager _hiveManager;
  final Box _box;

  OfflineDataSourceImpl(this._hiveManager):_box = Hive.box('offline_tasks');
  @override
  Future<Result<String?>> checkUser() {
    return executeHive(() async {
      return await _hiveManager.getToken();
    });
  }

  @override
  Future<Result<User>> getUser() {
    return executeHive(() async {
      final result = await _hiveManager.getUser();
      return HiveUserDto.toEntity(result);
    });
  }

  @override
  Future<Result<bool>> setUser(User user, String token) {
    return executeHive(() async {
      final result =
      await _hiveManager.setUser(HiveUserDto.toHiveModel(user), token);
      return result;
    });
  }

  @override
  Future<List<Todos>> getCachedTodos() async {
    if (!_box.containsKey('todos')) return [];
    final storedData = _box.get('todos') as List<dynamic>;
    return storedData.map((e) => Todos.fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  Future<void> cacheTodos(List<Todos> todos) async {
    _box.put('todos', todos.map((e) => e.toJson()).toList());
  }
}