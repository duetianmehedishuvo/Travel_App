import 'package:demo/data/model/base/api_response.dart';
import 'package:demo/data/model/user_model.dart';
import 'package:demo/data/repository/profile_repo.dart';
import 'package:demo/utilites/colors.dart';
import 'package:demo/utilites/helper.dart';
import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  final ProfileRepo profileRepo;

  ProfileProvider({required this.profileRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // get User
  UserModel? user;

  getUserProfiles(BuildContext context) async {
    _isLoading = true;
    ApiResponse apiResponse = await profileRepo.getCustomerProfile();
    _isLoading = false;
    if (apiResponse.response.statusCode == 200) {
      user = UserModel.fromJson(apiResponse.response.data['user'][0]);
      print(user!.toJson());
    } else {
      Helper.showSnack(context, apiResponse.error.toString(), color: redColor);
    }
    notifyListeners();
  }

  //////// for switch ///// *********

  bool switchOn = true;

  changeSwitchStatus(bool value) {
    switchOn = value;
    notifyListeners();
  }

  ////****** for Update Password *******////

  bool _isLoadingPassword = false;

  bool get isLoadingPassword => _isLoadingPassword;

  updatePassword(BuildContext context, Map<String, dynamic> map, Function callBack) async {
    _isLoadingPassword = true;
    notifyListeners();
    ApiResponse apiResponse = await profileRepo.updatePassword(map);
    _isLoadingPassword = false;
    if (apiResponse.response.statusCode == 200) {
      //showCustomSnackBar(apiResponse.response.data['message'], context, isError: false);
      callBack(true);
    } else {
      //showCustomSnackBar(apiResponse.error.toString(), context);
      callBack(false);
    }
    notifyListeners();
  }
}