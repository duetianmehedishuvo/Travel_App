import 'package:demo/data/model/base/error_response.dart';
import 'package:dio/dio.dart';

class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              errorDescription = "Request to API server was cancelled";
              break;
            case DioErrorType.connectTimeout:
              errorDescription = "Connection timeout with API server";
              break;
            case DioErrorType.other:
              errorDescription = "Connection to API server failed due to internet connection";
              break;
            case DioErrorType.receiveTimeout:
              errorDescription = "Receive timeout in connection with API server";
              break;
            case DioErrorType.response:
              switch (error.response!.statusCode) {
                case 404:
                case 401:
                case 400:
                case 500:
                case 503:
                  errorDescription = error.response!.data['message'];
                  break;
                case 422:
                  errorDescription = error.response!.data['message'];
                  break;
                default:
                  ErrorResponse errorResponse = ErrorResponse.fromJson(error.response!.data);
                  if (errorResponse.error.isNotEmpty) {
                    errorDescription = errorResponse;
                  } else {
                    errorDescription = "Failed to load data - status code: ${error.response!.statusCode}";
                  }
              }
              break;
            case DioErrorType.sendTimeout:
              errorDescription = "Send timeout with server";
              break;
          }
        } else {
          errorDescription = "Unexpected error occured";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "is not a subtype of exception";
    }
    return errorDescription;
  }
}
