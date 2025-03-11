// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/contracts/offline_data_source.dart' as _i55;
import '../../data/contracts/online_data_source.dart' as _i488;
import '../../data/data_source_impl/offline_data_source_impl.dart' as _i192;
import '../../data/data_source_impl/online_data_source_impl.dart' as _i523;
import '../../data/network/api_manager.dart' as _i190;
import '../../data/network/network_module.dart' as _i990;
import '../../data/repository_impl/repository_impl.dart' as _i109;
import '../../domain/repository/repository.dart' as _i131;
import '../../domain/use_cases/check_cached_user_use_case.dart' as _i166;
import '../../domain/use_cases/delete_todo_usecase.dart' as _i383;
import '../../domain/use_cases/get_cached_user_use_case.dart' as _i74;
import '../../domain/use_cases/get_todo_usecase.dart' as _i115;
import '../../domain/use_cases/login_use_case.dart' as _i471;
import '../../domain/use_cases/set_cached_user_use_case.dart' as _i292;
import '../../domain/use_cases/update_todo_usecase.dart' as _i366;
import '../../presentaion/home_screen/view_model/home_view_model.dart' as _i182;
import '../../presentaion/login_screen/view_model/login_view_model.dart'
    as _i327;
import '../local/hive/hive_manager.dart' as _i228;
import '../providers/user_provider.dart' as _i26;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.singleton<_i228.HiveManager>(() => _i228.HiveManager());
    gh.lazySingleton<_i26.UserProvider>(() => _i26.UserProvider());
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.factory<_i55.OfflineDataSource>(
        () => _i192.OfflineDataSourceImpl(gh<_i228.HiveManager>()));
    gh.singleton<_i190.ApiManager>(() => _i190.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i488.OnlineDataSource>(
        () => _i523.OnlineDataSourceImpl(gh<_i190.ApiManager>()));
    gh.factory<_i131.Repository>(() => _i109.RepositoryImpl(
          gh<_i488.OnlineDataSource>(),
          gh<_i55.OfflineDataSource>(),
        ));
    gh.factory<_i166.CheckCachedUserUseCase>(
        () => _i166.CheckCachedUserUseCase(gh<_i131.Repository>()));
    gh.factory<_i74.GetCachedUserUseCase>(
        () => _i74.GetCachedUserUseCase(gh<_i131.Repository>()));
    gh.factory<_i471.LoginUseCase>(
        () => _i471.LoginUseCase(gh<_i131.Repository>()));
    gh.factory<_i292.SetCachedUserUseCase>(
        () => _i292.SetCachedUserUseCase(gh<_i131.Repository>()));
    gh.factory<_i383.DeleteToDoUseCase>(
        () => _i383.DeleteToDoUseCase(gh<_i131.Repository>()));
    gh.factory<_i115.GetToDoUseCase>(
        () => _i115.GetToDoUseCase(gh<_i131.Repository>()));
    gh.factory<_i366.UpdateToDoUseCase>(
        () => _i366.UpdateToDoUseCase(gh<_i131.Repository>()));
    gh.factory<_i182.HomeViewModel>(() => _i182.HomeViewModel(
          gh<_i115.GetToDoUseCase>(),
          gh<_i366.UpdateToDoUseCase>(),
          gh<_i383.DeleteToDoUseCase>(),
        ));
    gh.factory<_i327.LoginViewModel>(() => _i327.LoginViewModel(
          gh<_i471.LoginUseCase>(),
          gh<_i292.SetCachedUserUseCase>(),
          gh<_i166.CheckCachedUserUseCase>(),
          gh<_i74.GetCachedUserUseCase>(),
        ));
    return this;
  }
}

class _$DioModule extends _i990.DioModule {}
