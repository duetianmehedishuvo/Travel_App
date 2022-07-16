import 'dart:io';

import 'package:demo/data/datasource/remote/dio/dio_client.dart';
import 'package:demo/data/datasource/remote/exception/api_error_handler.dart';
import 'package:demo/data/model/base/api_response.dart';
import 'package:demo/data/repository/auth_repo.dart';
import 'package:demo/utilites/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ProfileRepo {
  final DioClient dioClient;
  final AuthRepo authRepo;

  ProfileRepo({required this.dioClient, required this.authRepo});

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
      response = await dioClient.post('update-password', data: map);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> uploadPhoto(Map<String, dynamic> map, File file) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      String fileName = file.path.split('/').last;
      map.addAll({"image": await MultipartFile.fromFile(file.path, filename: fileName)});
      print(map);
      response = await dioClient.post('${AppConstant.baseUrl}${AppConstant.userUpdateURI}', data: map);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print('sssjjs ${e.toString()}');
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
}
