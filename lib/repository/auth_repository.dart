// ignore_for_file: use_rethrow_when_possible

import 'package:mvvm_architecture/data/network/BaseApiService.dart';
import 'package:mvvm_architecture/data/network/NetworkApiService.dart';
import 'package:mvvm_architecture/res/app_url.dart';

class AuthRepository {
  final BaseApiService _baseApiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _baseApiService.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response = await _baseApiService.getPostApiResponse(
          AppUrl.registerEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
