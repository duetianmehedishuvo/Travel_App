import 'package:demo/provider/profile_provider.dart';
import 'package:demo/screens/utilitis/submit_button.dart';
import 'package:demo/utilites/colors.dart';
import 'package:demo/utilites/helper.dart';
import 'package:demo/utilites/text.styles.dart';
import 'package:demo/widgets/custom_loader.dart';
import 'package:demo/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePasswordDialog extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  _updatePassword(BuildContext context) {
    if (passwordController.text.isEmpty || newPasswordController.text.isEmpty) {
      Helper.showSnack(context, 'Password field are required');
    } else {
      Map<String, dynamic> map = {
        "current_password": passwordController.text,
        "new_password": newPasswordController.text,
        "password_confirmation": newPasswordController.text
      };
      Provider.of<ProfileProvider>(context, listen: false).updatePassword(context, map, (bool status) {
        if (status == true) {
          Navigator.of(context).pop();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(clipBehavior: Clip.none, fit: StackFit.loose, children: [
        Positioned(
          left: 0,
          right: 0,
          top: -50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: CircleAvatar(backgroundColor: kPrimaryColor, radius: 40),
          ),
        ),
        Positioned(
          left: 20,
          right: 0,
          top: 40,
          child: Text('Change Password:', style: headline4.copyWith(fontSize: 14)),
        ),
        Padding(
          padding: EdgeInsets.only(top: 70),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                child: Consumer<ProfileProvider>(
                  builder: (context, profileProvider, child) => Column(
                    children: [
                      SizedBox(height: 5),
                      CustomTextField(
                        hintText: 'Old Password',
                        isPassword: true,
                        isShowBorder: true,
                        isShowSuffixIcon: true,
                        controller: passwordController,
                      ),
                      SizedBox(height: 5),
                      CustomTextField(
                        hintText: 'New Password',
                        isPassword: true,
                        isShowBorder: true,
                        isShowSuffixIcon: true,
                        controller: newPasswordController,
                      ),
                      SizedBox(height: 15),
                      !profileProvider.isLoadingPassword
                          ? CustomButton(
                              title: 'Update Password',
                              color: kButtonColor,
                              onTap: () {
                                _updatePassword(context);
                              })
                          : CustomLoader(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
