import 'package:flutter/material.dart';
import 'package:linkyou_task/core/routes/app_routes.dart';
import 'package:linkyou_task/core/routes/route_not_found.dart';
import 'package:linkyou_task/presentaion/home_screen/view/home_view.dart';
import 'package:linkyou_task/presentaion/login_screen/view/login_view.dart';


Route manageRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginScreenRoute:
      return MaterialPageRoute(
        builder: (context) =>  LoginScreen(),
      );
    case AppRoutes.homeScreenRoute:
      return MaterialPageRoute(
        builder: (context) =>  HomeScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const RouteNotFound(),
      );
  }
}
