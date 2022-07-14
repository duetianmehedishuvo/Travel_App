import 'package:demo/data/datasource/remote/dio/dio_client.dart';
import 'package:demo/data/datasource/remote/exception/api_error_handler.dart';
import 'package:demo/data/model/base/api_response.dart';
import 'package:demo/utilites/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> signUp(String name, String phone, String email, String password) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.post('${AppConstant.signup}',
          data: {"name": name, "email": email, "password": password, "phone": phone});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> signIn(String email, String password) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.post('${AppConstant.baseUrl}${AppConstant.login}', data: {"email": email, "password": password});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> forgotPassword(String emailAddress) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.post('${AppConstant.forgotPasswordURI}', data: {"email": "$emailAddress"});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }


  // for  user token
  Future<void> saveUserToken(String token) async {
    dioClient.token = token;
    dioClient.dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};

    try {
      await sharedPreferences.setString(AppConstant.token, token);
    } catch (e) {
      rethrow;
    }
  }

  bool checkTokenExist() {
    return sharedPreferences.containsKey(AppConstant.token);
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstant.token) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstant.token);
  }

  Future<bool> clearToken() async {
    return sharedPreferences.remove(AppConstant.token);
  }

  Future<bool> clearUserID() async {
    return sharedPreferences.remove(AppConstant.userID);
  }

  Future<bool> clearEmail2() async {
    return sharedPreferences.remove(AppConstant.userEmail2);
  }

  Future<bool> clearUser() async {
    return sharedPreferences.remove(AppConstant.user);
  }

  // for  Remember Email
  Future<void> saveUserEmailAndPassword(String email, String password) async {
    try {
      await sharedPreferences.setString(AppConstant.userEmail, email);
      await sharedPreferences.setString(AppConstant.userPassword, password);
    } catch (e) {
      rethrow;
    }
  }

  // for  Remember Email
  Future<void> saveUserEmail(String email) async {
    try {
      await sharedPreferences.setString(AppConstant.userEmail2, email);
    } catch (e) {
      rethrow;
    }
  }

  // for  Remember Email

  Future<void> saveUserID(int userID) async {
    try {
      await sharedPreferences.setInt(AppConstant.userID, userID);
    } catch (e) {
      rethrow;
    }
  }

  int getUserID() {
    return sharedPreferences.getInt(AppConstant.userID) ?? -1;
  }

  bool isExistsCustomerID() {
    return sharedPreferences.containsKey(AppConstant.userID);
  }

  String getUserEmail() {
    return sharedPreferences.getString(AppConstant.userEmail) ?? "";
  }

  String getUserEmail2() {
    return sharedPreferences.getString(AppConstant.userEmail2) ?? "";
  }

  String getUserPassword() {
    return sharedPreferences.getString(AppConstant.userPassword) ?? "";
  }

  Future<bool> clearUserEmailAndPassword() async {
    await sharedPreferences.remove(AppConstant.userPassword);
    return await sharedPreferences.remove(AppConstant.userEmail);
  }
}
