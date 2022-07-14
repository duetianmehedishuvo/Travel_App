import 'package:demo/data/model/base/api_response.dart';
import 'package:demo/data/repository/auth_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo authRepo;

  AuthProvider({required this.authRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // for Sign in Section

  Future signIn(String email, String password, Function callback) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo.signIn(email, password);
    _isLoading = false;

    if (apiResponse.response.statusCode == 200) {
      if (authRepo.checkTokenExist()) {
        clear();
      }
      authRepo.saveUserToken(apiResponse.response.data['access_token']);
      callback(true, '');
    } else {
      callback(false, '${apiResponse.error.toString()}');
    }
    notifyListeners();
  }

  //for Forgot Password  Section
  bool isForgotPasswordLoading = false;

  Future forgotPassword(String email, Function callback) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo.forgotPassword(email);
    _isLoading = false;
    if (apiResponse.response.statusCode == 200 || apiResponse.response.statusCode == 201) {
      callback(true, apiResponse.response.data['message']);
    } else {
      callback(false, 'Email doesn\'t Exists.');
    }
    notifyListeners();
  }

  // for sign up section

  Future signUP(String name, String phone, String email, String password, Function callback) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo.signUp(name, phone, email, password);
    _isLoading = false;

    if (apiResponse.response.statusCode == 200) {
      if (authRepo.checkTokenExist()) {
        clear();
      }
      authRepo.saveUserToken(apiResponse.response.data['access_token']);

      callback(true, '${apiResponse.response.data['message']}');
    } else {
      callback(false, '${apiResponse.error.toString()}');
    }
    notifyListeners();
  }

  int getUserID() {
    return authRepo.getUserID();
  }

  // for Remember Me Section

  bool _isActiveRememberMe = true;

  bool get isActiveRememberMe => _isActiveRememberMe;

  toggleRememberMe() {
    _isActiveRememberMe = !_isActiveRememberMe;
    notifyListeners();
  }

  void saveUserEmailAndPassword(String email, String password) {
    authRepo.saveUserEmailAndPassword(email, password);
  }

  String getUserEmail() {
    return authRepo.getUserEmail();
  }

  Future<bool> clearUserEmailAndPassword() async {
    return authRepo.clearUserEmailAndPassword();
  }

  String getUserPassword() {
    return authRepo.getUserPassword();
  }

  // for user Section
  String getUserToken() {
    return authRepo.getUserToken();
  }

  // for Email
  String getEmail2() {
    return authRepo.getUserEmail2();
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  clear() {
    clearUserID();
    clearSharedData();
  }

  clearSharedData() async {
    if (authRepo.isLoggedIn()) await authRepo.clearToken();
  }

  clearUserID() async {
    if (authRepo.isExistsCustomerID()) await authRepo.clearUserID();
  }

  int selectResetPasswordOption = 0;

  initializeResetPassword() {
    selectResetPasswordOption = 0;
  }

  void changeResetPasswordOption(int value) {
    selectResetPasswordOption = value;
    notifyListeners();
  }
}
