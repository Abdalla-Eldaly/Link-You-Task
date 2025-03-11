import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:linkyou_task/core/providers/user_provider.dart';
import 'package:linkyou_task/presentaion/base/bloc_observer.dart';
import 'package:linkyou_task/presentaion/resources/langauge_manager.dart';
import 'package:linkyou_task/presentaion/resources/theme_manger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/di/di.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/router.dart';
import 'data/models/cache/cache_user_model.dart';
import 'package:easy_localization/easy_localization.dart';

late final WidgetsBinding engine;

void main()async {
  engine = WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  Bloc.observer = SimpleBlocObserver();
 await Hive.initFlutter();
  await EasyLocalization.ensureInitialized();

  Hive.registerAdapter(CacheUserModelAdapter());
  final box = await Hive.openBox('user');
  await Hive.openBox('offline_tasks');
  runApp(ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: EasyLocalization(
          supportedLocales: AppLanguages.locals,
          path: AppLanguages.translationsPath,
          fallbackLocale: AppLanguages.fallBackLocal,
          startLocale: AppLanguages.startLocal,
          useOnlyLangCode: true,
          saveLocale: true,
          child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 890),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'LinkYou',
        theme: ThemeManager.themeManager,
        onGenerateRoute: manageRoutes,
        initialRoute: AppRoutes.loginScreenRoute,
        home: child,
      ),
    );
  }
}
