import 'package:demo/data/datasource/remote/dio/dio_client.dart';
import 'package:demo/data/datasource/remote/exception/api_error_handler.dart';
import 'package:demo/data/model/base/api_response.dart';
import 'package:demo/utilites/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepo {
  final DioClient dioClient;

  ProfileRepo({required this.dioClient});

  Future<ApiResponse> getCustomerProfile() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get('${AppConstant.baseUrl}${AppConstant.userProfileUri}');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> updatePassword(Map<String, dynamic> map) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.put('/user/change-password/', data: map);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

}
