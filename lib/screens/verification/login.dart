import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:transport/screens/verification/otp.dart';

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

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

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
                                      color: PrimaryColor,
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
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () async{
                                  final code = await countryPicker.showPicker(context: context);
                                  setState(() {
                                    countryCode = code;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  constraints: BoxConstraints(
                                      maxWidth: 65
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(7)
                                  ),
                                  child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              child: Text(countryCode != null ? countryCode!.dialCode : "+91")
                                          ),
                                          SizedBox(width: 3),
                                          Container(
                                            width: 17,
                                            height: 17,
                                              child: countryCode != null ? countryCode!.flagImage : CountryCodeFlag(flagUri: 'assets/flags/in.png')
                                          ),
                                        ],
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(width: 2),
                              Flexible(
                                child: SizedBox(
                                  height: 50,
                                  child: TextFormField(
                                    validator: (value) {

                                      if(value!.isEmpty){
                                        errorLabel = 'Phone no';
                                        setState(() {
                                          visibility = true;
                                        });
                                      }
                                    },
                                    controller: phoneController,
                                    cursorColor: PrimaryColor,
                                    keyboardType: TextInputType.phone,
                                    textInputAction: TextInputAction.done,
                                    maxLines: 1,
                                    maxLength: 10,
                                    decoration: InputDecoration(
                                      counterText: '',
                                      hintText: '333 333 3333',
                                      hintStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.6,
                                          fontSize: 12.0
                                      ),
                                      contentPadding: const EdgeInsets.all(20.0),
                                      enabledBorder:  const OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0XFF999999)),
                                        borderRadius: BorderRadius.all( Radius.circular(7.0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7.0),
                                        borderSide: const BorderSide(color: Color(0XFF999999)),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7.0),
                                        borderSide: const BorderSide(color: Colors.red),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7.0),
                                        borderSide: const BorderSide(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: !visibility,
                            child: SizedBox(height: deviceHeight * 0.08)
                        ),
                        Visibility(
                          visible: visibility,
                            child: Container(
                              width: deviceWidth,
                              height: 45,
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              decoration: BoxDecoration(
                                  color: Color(0xFFFFF2DE),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:  [
                                  Icon(Icons.info_outlined,
                                    color: Color(0xFFFFAE34),
                                  ),
                                  SizedBox(width: 10),
                                  Text(errorLabel,
                                    style: TextStyle(
                                      color: Color(0xFFFFAE34),
                                    ),
                                  )
                                ],
                              ),
                            )
                        ),

                        PrimaryButton.nameofPrimaryButton(context, 'CREATE ACCOUNT', (){

                          if(formKey.currentState!.validate()) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(phoneNumber: '${phoneController.text}')));
                          }

                        }
                        ),
                        const SizedBox(height: 35,),

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
