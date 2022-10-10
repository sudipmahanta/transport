import 'package:flutter/material.dart';
import 'package:transport/constants/utils/utils.dart';
import 'package:transport/screens/verification/sucess_screen.dart';

class OtpScreen extends StatefulWidget {
  String phoneNumber;
  OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  // Controllers
  final TextEditingController firstController= TextEditingController();
  final TextEditingController secondController= TextEditingController();
  final TextEditingController thirdController= TextEditingController();
  final TextEditingController fourthController= TextEditingController();
  final TextEditingController fifthController= TextEditingController();
  final TextEditingController sixthController= TextEditingController();

  // Focus Nodes
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();
  FocusNode fifthFocusNode = FocusNode();
  FocusNode sixthFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('assets/images/otp.png',
                  width: 280,
                  height: 280,
                ),
                SizedBox(height: 45),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('OTP Verification',
                      style: TextStyle(
                        letterSpacing: 1.5,
                        fontSize: 32,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('Enter OTP sent to your mobile no ${widget.phoneNumber}'),
                  ],
                ),

                Form(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OtpInputField.nameofOtpInputField(context, firstController, null, secondFocusNode),
                        SizedBox(width: 1),

                        OtpInputField.nameofOtpInputField(context, secondController, secondFocusNode, thirdFocusNode, ),
                        SizedBox(width: 1),

                        OtpInputField.nameofOtpInputField(context, thirdController, thirdFocusNode, fourthFocusNode, ),
                        SizedBox(width: 1),

                        OtpInputField.nameofOtpInputField(context, fourthController, fourthFocusNode, fifthFocusNode),
                        SizedBox(width: 1),

                        OtpInputField.nameofOtpInputField(context, fifthController, fifthFocusNode, sixthFocusNode),
                        SizedBox(width: 1),

                        OtpInputField.nameofOtpInputField(context, sixthController, sixthFocusNode, null),
                      ],
                    )
                ),
                SizedBox(height: 15),

                Container(
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
                    children: const [
                      Icon(Icons.info_outlined,
                        color: Color(0xFFFFAE34),
                      ),
                      SizedBox(width: 10),
                      Text('Automatically reading  OTP',
                        style: TextStyle(
                          color: Color(0xFFFFAE34),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 35),

                PrimaryButton.nameofPrimaryButton(context, 'VERIFY', (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessScreen()));
                    }
                ),
              ],
            ),
          ),
        )
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Didn’t recieved OTP ? ',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            InkWell(
                onTap: () {},
                child: const Text(' Resend OTP',
                  style: TextStyle(
                      color: Color(0xFFFFAE34),

                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
