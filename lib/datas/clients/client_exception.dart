import 'package:dio/dio.dart';

class ClientException implements Exception {
  final Response? response;
  final String? message;

  ClientException({
    this.response,
    this.message,
  });

  @override
  String toString() {

    if(response != null) {
      final statusCode = response!.statusCode;
      final responseMessage = response?.data?['message'] ?? "Unexpected error occurred";

      if (statusCode != null) {
        if (statusCode >= 400 && statusCode < 500) {
          return responseMessage; // client side
        } else if (statusCode >= 500) {
          return 'Internal Server Error'; // server side 
        }
      }
    }
    
    return message ?? "Network Error";
  }
}