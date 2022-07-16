import 'dart:io';

import 'package:demo/provider/profile_provider.dart';
import 'package:demo/screens/user_about/widget/change_password_dialog.dart';
import 'package:demo/screens/utilitis/constant/color.dart';
import 'package:demo/screens/utilitis/custom_textfield.dart';
import 'package:demo/screens/utilitis/submit_button.dart';
import 'package:demo/utilites/app_constant.dart';
import 'package:demo/utilites/colors.dart';
import 'package:demo/utilites/helper.dart';
import 'package:demo/utilites/images.dart';
import 'package:demo/widgets/animated_custom_dialog.dart';
import 'package:demo/widgets/app_widget.dart';
import 'package:demo/widgets/custom_loader.dart';
import 'package:demo/widgets/custom_parent_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _dobController = TextEditingController();
  TextEditingController _genderController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _cityController = new TextEditingController();

  List<String> gender = ["Male", "Female", "Other"];
  var items = ["Male", "Female", "Other"];

  Future<void> _selectDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year - 20),
        firstDate: DateTime(DateTime.now().year - 30),
        lastDate: DateTime(DateTime.now().year + 20));
    if (picked != null)
      setState(() {
        _dobController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
  }

  File? file;
  final picker = ImagePicker();

  void _choose() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (pickedFile != null) {
        file = File(pickedFile.path);
        // Provider.of<ProfileProvider>(context, listen: false).updateUserInfo( file!);
        Provider.of<ProfileProvider>(context, listen: false).updateProfileImage(context, file!);
      } else {
        Helper.showSnack(context, 'No Image Selected');
      }
    });
  }

  _updateProfile() {
    if (_nameController.text.isEmpty ||
        _dobController.text.isEmpty ||
        _genderController.text.isEmpty ||
        _cityController.text.isEmpty ||
        _phoneController.text.isEmpty) {
      Helper.showSnack(context, 'All Fields are required');
    } else {
      Map<String, dynamic> map = {
        "name": _nameController.text,
        "gender": _genderController.text,
        "address": _cityController.text,
        "phone": _phoneController.text,
        "date_of_birth": _dobController.text,
        "city": _cityController.text,
        "location": _cityController.text
      };

      Provider.of<ProfileProvider>(context, listen: false).updateProfile(context, map);
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProvider>(context, listen: false).getUserProfiles(context);

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Consumer<ProfileProvider>(
            builder: (context, profileProvider, child) {
              if (!profileProvider.isLoading && profileProvider.user != null) {
                _nameController.text = profileProvider.user!.name!;
                _phoneController.text = profileProvider.user!.phone!;
                _cityController.text = profileProvider.user!.city!;
                _dobController.text = profileProvider.user!.dateOfBirth!;
                _genderController.text = profileProvider.user!.gender!.isEmpty ? "Male" : profileProvider.user!.gender!;
                // newPasswordController.text = ''; https://travels.dd.limited/uploads/user/1657987237_62d2e0a55f3f0.png
                // passwordController.text = '';
              }

              return CustomParentWidget(
                child: ModalProgressHUD(
                  inAsyncCall: profileProvider.isLoading,
                  child: Container(
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Images.backgroundImage), fit: BoxFit.cover)),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 40,
                              height: 40,
                              child: FloatingActionButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(Icons.arrow_back),
                                  backgroundColor: kPrimaryColor.withOpacity(.4)),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      "Almost There!",
                                      style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 80),
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              border: Border.all(color: kPrimaryColor.withOpacity(.6), width: 1), shape: BoxShape.circle),
                                          child: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              !profileProvider.isLoading && file == null
                                                  ? getCircularImage(100, '${AppConstant.imageBaseUrl}${profileProvider.user!.image}')
                                                  : file != null && !profileProvider.isLoading
                                                      ? ClipRRect(
                                                          borderRadius: BorderRadius.circular(50),
                                                          child: Image.file(file!, width: 100, height: 100, fit: BoxFit.fill))
                                                      : const CustomLoader(),
                                              !profileProvider.isLoading
                                                  ? Positioned(
                                                      bottom: 0,
                                                      right: -10,
                                                      child: CircleAvatar(
                                                        backgroundColor: Color(0xFFfe9585),
                                                        radius: 20,
                                                        child: IconButton(
                                                            onPressed: () {
                                                              _choose();
                                                            },
                                                            padding: const EdgeInsets.all(0),
                                                            icon: const Icon(Icons.edit, color: Colors.white, size: 18)),
                                                      ),
                                                    )
                                                  : const SizedBox.shrink(),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 49),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CustomTextfield1(
                                                  readOnly: false,
                                                  obscureText: false,
                                                  Controller: _nameController,
                                                  color: PColor.textfieldColor,
                                                  title: "Full Name"),
                                              SizedBox(height: 15),
                                              IntlPhoneField(
                                                controller: _phoneController,
                                                style: TextStyle(color: Colors.white),
                                                initialCountryCode: 'BD',
                                                onChanged: (phone) {
                                                  print(phone.completeNumber);
                                                },
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Color(0xffF7F7F7).withOpacity(0.4),
                                                  hintText: " Phone ",
                                                  hintStyle: TextStyle(color: Colors.white),
                                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(27.5)),
                                                  disabledBorder: InputBorder.none,
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(),
                                                    borderRadius: BorderRadius.circular(25.0),
                                                  ),
                                                ),
                                              ),
                                              CustomTextfield1(
                                                readOnly: true,
                                                obscureText: false,
                                                Controller: _dobController,
                                                color: PColor.socialLogoButtonColor,
                                                title: "Date of Birth ",
                                                icon: IconButton(
                                                  onPressed: () => _selectDateFromPicker(context),
                                                  icon: Icon(
                                                    Icons.calendar_today_outlined,
                                                    color: Colors.white.withOpacity(0.4),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Expanded(
                                                    child: CustomTextfield1(
                                                      Controller: _genderController,
                                                      color: PColor.socialLogoButtonColor,
                                                      title: "Gender",
                                                      obscureText: false,
                                                      readOnly: true,
                                                      icon: PopupMenuButton<String>(
                                                        color: Colors.white,
                                                        icon: const Icon(
                                                          Icons.arrow_drop_down,
                                                          color: Colors.black,
                                                        ),
                                                        onSelected: (String value) {
                                                          _genderController.text = value;
                                                        },
                                                        itemBuilder: (BuildContext context) {
                                                          return items.map<PopupMenuItem<String>>((String value) {
                                                            return new PopupMenuItem(
                                                                child: Column(
                                                                  children: [
                                                                    new Text(
                                                                      value,
                                                                    ),
                                                                  ],
                                                                ),
                                                                value: value);
                                                          }).toList();
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: CustomTextfield1(
                                                        Controller: _cityController,
                                                        color: PColor.socialLogoButtonColor,
                                                        title: "City",
                                                        obscureText: false,
                                                        readOnly: false),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 28,
                                              ),
                                              Text(
                                                "What do you prefer?",
                                                style: TextStyle(color: Colors.white, fontSize: 18),
                                              ),
                                              SizedBox(height: 15),
                                              Container(
                                                height: 34,
                                                child: ListView(
                                                  physics: BouncingScrollPhysics(),
                                                  scrollDirection: Axis.horizontal,
                                                  shrinkWrap: true,
                                                  children: [
                                                    SizedBox(
                                                        width: 110,
                                                        height: 34,
                                                        child: CustomButton(title: "Mountains", color: PColor.textfieldColor, onTap: () {})),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    SizedBox(
                                                        width: 77,
                                                        height: 34,
                                                        child: CustomButton(title: "Rivers", color: PColor.textfieldColor, onTap: () {})),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    SizedBox(
                                                      width: 85,
                                                      height: 34,
                                                      child:
                                                          CustomButton(title: "Desert", tcolor: Color(0xff08BA64), color: Colors.white, onTap: () {}),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    SizedBox(
                                                        width: 65,
                                                        height: 34,
                                                        child:
                                                            CustomButton(title: "Sea", tcolor: Color(0xff08BA64), color: Colors.white, onTap: () {})),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text("Enable location for better experience",
                                                        style: TextStyle(color: Colors.white, fontSize: 15)),
                                                  ),
                                                  Switch(
                                                      activeTrackColor: Color(0xff08BA64),
                                                      inactiveTrackColor: Color(0xff08BA64).withOpacity(.4),
                                                      activeColor: Colors.white,
                                                      value: profileProvider.switchOn,
                                                      onChanged: (_value) {
                                                        profileProvider.changeSwitchStatus(_value);
                                                      })
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                      width: 151,
                                                      child: CustomButton(
                                                        title: 'Change Password',
                                                        color: PColor.submitButtonColor,
                                                        onTap: () {
                                                          showAnimatedDialog(context, ChangePasswordDialog(), isFlip: false);
                                                        },
                                                      ))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            color: Colors.transparent,
                            height: 60,
                            child: SizedBox(
                              height: 50,
                              width: 140,
                              child: CustomButton(
                                  title: "Update",
                                  size: 16,
                                  color: PColor.submitButtonColor,
                                  onTap: () {
                                    _updateProfile();
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }

  void showPopUpMenuAtTap(BuildContext context, TapDownDetails details) {
    showMenu(
      items: [
        PopupMenuItem(
          child: Text("item 1"),
          value: 1,
        ),
        PopupMenuItem(
          child: Text("item 1"),
          value: 2,
        ),
      ],
      context: context,
      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy,
        details.globalPosition.dx,
        details.globalPosition.dy,
      ),
      // other code as above
    );
  }
}
