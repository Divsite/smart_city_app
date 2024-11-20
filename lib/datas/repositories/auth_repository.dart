import 'package:dio/dio.dart';
import 'package:smart_city_app/consts/app_constant.dart';
import 'package:smart_city_app/datas/clients/client_dio.dart';
import 'package:smart_city_app/datas/clients/client_exception.dart';
import 'package:smart_city_app/datas/models/responses/api_response.dart';

class AuthRepository {
  final ClientDio clientDio;

  AuthRepository({required this.clientDio});

  Future<ApiResponse> getProfile() async {
    try {
      final Response response = await clientDio.get(
        url : AppConstant.viewProfile
      );

      return ApiResponse.withSuccess(response);
    } on ClientException catch (e) {
      return ApiResponse.withError(e.toString());
    }
  }

  Future<ApiResponse> login({required String username, required String password}) async {
    try {
      final Response response = await clientDio.post(
        url: AppConstant.login,
        data: {
          'username': username,
          'password': password
        }
      );

      final String token = response.data['access_token'];

      clientDio.token = token;
      return ApiResponse.withSuccess(response);
    } on ClientException catch (e) {
      return ApiResponse.withError(e.toString());
    }
  }

  Future<ApiResponse> logout() async {
    try {
      final Response response = await clientDio.post(
        url: AppConstant.signout
      );
      return ApiResponse.withSuccess(response);
    } on ClientException catch (e) {
      return ApiResponse.withError(e.toString());
    }
  }
}
