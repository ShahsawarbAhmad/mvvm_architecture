import 'package:flutter/material.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/view/home_screen.dart';
import 'package:mvvm_architecture/view/login_view.dart';
import 'package:mvvm_architecture/view/signup_view.dart';
import 'package:mvvm_architecture/view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );

      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );

      case RoutesName.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpView(),
        );

      default:
        return MaterialPageRoute(
            builder: ((context) => const Scaffold(
                  body: Center(
                    child: Text(" no route defined"),
                  ),
                )));
    }
  }
}
