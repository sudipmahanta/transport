import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:transport/constants/utils/buttons.dart';
import 'package:transport/screens/verification/otp.dart';
import 'package:transport/screens/verification/widget/auth_input_field.dart';

import '../../constants/utils/colors_package.dart';
import '../../constants/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;

  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool visibility = false;
  String errorLabel ="";

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: BackGroundColor,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/anygari.png",
                          width: 160,
                          height: 160,
                        ),

                        RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Welcome to ',
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.black,
                                    )
                                ),
                                TextSpan(
                                    text: 'AnyGari',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontStyle: FontStyle.italic,
                                      color: primaryColor,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                              ],
                            )
                        ),
                        const SizedBox(height: 15),

                        const Text('Sign up to Continue',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.5,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 30),

                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Mobile Number',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        Form(
                            key: formKey,
                            child: const PhoneNumberVerification()
                        ),
                        SizedBox(height: height * 0.08),
                        // Visibility(
                        //   visible: visibility,
                        //     child: Container(
                        //       width: deviceWidth,
                        //       height: 45,
                        //       padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        //       decoration: BoxDecoration(
                        //           color: Color(0xFFFFF2DE),
                        //           borderRadius: BorderRadius.circular(10)
                        //       ),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         crossAxisAlignment: CrossAxisAlignment.center,
                        //         children:  [
                        //           Icon(Icons.info_outlined,
                        //             color: Color(0xFFFFAE34),
                        //           ),
                        //           SizedBox(width: 10),
                        //           Text(errorLabel,
                        //             style: TextStyle(
                        //               color: Color(0xFFFFAE34),
                        //             ),
                        //           )
                        //         ],
                        //       ),
                        //     )
                        // ),

                        PrimaryButton(
                          width: width * 0.65,
                          label: 'CREATE ACCOUNT',
                          onPressed: () {
                            if(formKey.currentState!.validate()) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(phoneNumber: '${phoneController.text}')));
                            }
                          },
                        ),
                        SizedBox(height: height * 0.045,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account? ',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            InkWell(
                                onTap: () {},
                                child: const Text('Sign in',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      decoration: TextDecoration.underline
                                  ),
                                )
                            ),
                          ],
                        ),
                      ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
