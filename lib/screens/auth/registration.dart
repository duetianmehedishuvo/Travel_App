import 'package:demo/provider/auth_provider.dart';
import 'package:demo/screens/auth/login.dart';
import 'package:demo/screens/utilitis/constant/color.dart';
import 'package:demo/screens/utilitis/custom_textfield.dart';
import 'package:demo/screens/utilitis/submit_button.dart';
import 'package:demo/utilites/helper.dart';
import 'package:demo/widgets/custom_parent_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool istap = false;
  final formKey = GlobalKey<FormState>();

  signUP(BuildContext context, AuthProvider authProvider) async {
    if (formKey.currentState!.validate()) {
      if (nameController.text.isEmpty ||
          phoneController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty ||
          confirmPasswordController.text.isEmpty) {
        Helper.showSnack(context, 'Please fill up all the field');
      } else {
        authProvider.signUP(nameController.text, phoneController.text, emailController.text.toString(), confirmPasswordController.text.toString(),
            (bool isLogin, String message) async {
          if (isLogin) {
            Helper.toRemoveUntiScreen(context, LogInScreen());
            Helper.showSnack(context, message);
          } else {
            Helper.showSnack(context, message);
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, child) => CustomParentWidget(
          child: ModalProgressHUD(
            inAsyncCall: authProvider.isLoading,
            child: Scaffold(
                backgroundColor: Colors.black,
                body: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/login_back.jpeg"), fit: BoxFit.cover)),
                      child: Container(
                        padding: EdgeInsets.only(top: 30),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("assets/travel_logo.png"),
                              Column(
                                children: [
                                  Text(
                                    "Email sign up",
                                    style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.w700),
                                  ),
                                  Divider(
                                    color: Colors.white.withOpacity(0.5),
                                    thickness: 2,
                                    indent: 180,
                                    endIndent: 180,
                                  ),
                                  SizedBox(
                                    height: 49,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                      children: [
                                        CustomTextfield(
                                          readOnly: false,
                                          obscureText: false,
                                          title: "Full Name",
                                          Controller: nameController,
                                          color: PColor.textfieldColor,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        CustomTextfield(
                                          readOnly: false,
                                          obscureText: false,
                                          title: "Your email address",
                                          Controller: emailController,
                                          color: PColor.textfieldColor,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        IntlPhoneField(
                                          controller: phoneController,
                                          style: TextStyle(color: Colors.white),
                                          initialCountryCode: 'BD',
                                          onChanged: (phone) {
                                            print(phone.completeNumber);
                                          },
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color(0xffF7F7F7).withOpacity(0.4),
                                            hintText: " Phone  ",
                                            hintStyle: TextStyle(
                                              color: Colors.white,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(27.5),
                                            ),
                                            disabledBorder: InputBorder.none,
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(),
                                              borderRadius: BorderRadius.circular(25.0),
                                            ),
                                          ),
                                        ),
                                        CustomTextfield(
                                          Controller: passwordController,
                                          color: PColor.socialLogoButtonColor,
                                          title: "Password",
                                          obscureText: !istap,
                                          readOnly: false,
                                          icon: InkWell(
                                            onTap: _togglePasswordView,
                                            child: Icon(
                                              istap ? Icons.visibility : Icons.visibility_off,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        CustomTextfield(
                                            readOnly: false,
                                            obscureText: false,
                                            Controller: confirmPasswordController,
                                            color: PColor.textfieldColor,
                                            title: "Confirm password")
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: 150,
                                    height: 50,
                                    child: SubmitButton(
                                      onTap: () {
                                        signUP(context, authProvider);
                                      },
                                      title: "Continue",
                                      size: 18,
                                      color: PColor.submitButtonColor,
                                      icon: Icons.arrow_forward,
                                      iconColor: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Already have an account?",
                                          style: TextStyle(fontSize: 18, color: Colors.white),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (_) => LogInScreen()));
                                          },
                                          child: Text(
                                            "Log in",
                                            style: TextStyle(color: Color(0xff08BA64), fontSize: 18),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    // if (ishiddenPassword == true) {
    //   ishiddenPassword = false;
    // } else {
    //   ishiddenPassword = true;
    // }
    setState(() {
      istap = !istap;
    });
  }
}
