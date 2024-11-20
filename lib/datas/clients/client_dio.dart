import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_city_app/consts/app_constant.dart';
import 'package:smart_city_app/datas/clients/client_exception.dart';
import 'package:smart_city_app/datas/clients/logging_interceptor.dart';
import 'package:smart_city_app/utils/extensions/globals.dart';

class ClientDio {
  final SharedPreferences sharedPreferences;
  late final Dio dio;

  String? token;

  ClientDio({
    required this.sharedPreferences,
  }) {
    final baseOptions = BaseOptions(
      baseUrl: AppConstant.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      contentType: 'application/json',
      responseType: ResponseType.json,
      followRedirects: true,
    );

    dio = Dio(baseOptions);
    dio.interceptors.add(LoggingInterceptor());
    dio.interceptors.add(globalAlice.getDioInterceptor()); // add alice in dio for logging from responses and requests
  }

  Future<Map<String, dynamic>> headersRequest() async {
    final token = sharedPreferences.getString(AppConstant.token);
    return {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
      'Accept': 'application/json',
    };
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? parameters,
  }) async {
    final header = await headersRequest();
    return await safeFetch(() => dio.get(
      url,
      queryParameters: parameters ?? {},
      options: Options(headers: header),
    ));
  }

  Future<Response> post({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,  
  }) async {
    final header = await headersRequest();
    return await safeFetch(() => dio.post(
      url,
      data: data,
      options: Options(headers: header),
      queryParameters: queryParameters
    ));
  }

  Future<Response> put({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final header = await headersRequest();
    return await safeFetch(() => dio.put(
      url,
      data: data,
      options: Options(headers: header),
      queryParameters: queryParameters,
    ));
  }

  Future<Response> patch({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final header = await headersRequest();
    return await safeFetch(() => dio.patch(
      url,
      data: data,
      options: Options(headers: header),
      queryParameters: queryParameters,
    ));
  }

  Future<Response> delete({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final header = await headersRequest();
    return await safeFetch(() => dio.delete(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: header),
    ));
  }

  Future<Response> safeFetch(Future<Response> Function() tryFetch) async {
    try {
      final response = await tryFetch();
      return response;
    } on DioException catch (dioError) {
      switch (dioError.type) {
        case DioExceptionType.connectionTimeout:
          throw ClientException(message: "Connection timed out. Please check your connection.");
        case DioExceptionType.sendTimeout:
          throw ClientException(message: "Request timed out. Try again later.");
        case DioExceptionType.receiveTimeout:
          throw ClientException(message: "Response timed out. The server may be busy.");
        case DioExceptionType.badResponse:
          throw ClientException(message: "Received an invalid response from the server.", response: dioError.response!);
        default:
          throw ClientException(message: "An unexpected error occurred.");
      }
    } catch (e) {
      throw ClientException(message: e.toString());
    }
  }
}
