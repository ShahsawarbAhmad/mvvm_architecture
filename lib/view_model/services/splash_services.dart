import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/model/user_model.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      if (value.token == 'null' || value.token == '') {
        Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
