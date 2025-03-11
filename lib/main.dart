import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:linkyou_task/core/providers/user_provider.dart';
import 'package:linkyou_task/presentaion/base/bloc_observer.dart';
import 'package:linkyou_task/presentaion/resources/theme_manger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/di/di.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/router.dart';
import 'data/models/cache/cache_user_model.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = SimpleBlocObserver();
 await Hive.initFlutter();
  Hive.registerAdapter(CacheUserModelAdapter());
  final box = await Hive.openBox('user');
  await Hive.openBox('offline_tasks');

  runApp(ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp()));
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
        title: 'LinkYou',
        theme: ThemeManager.themeManager,
        onGenerateRoute: manageRoutes,
        initialRoute: AppRoutes.loginScreenRoute,
        home: child,
      ),
    );
  }
}
