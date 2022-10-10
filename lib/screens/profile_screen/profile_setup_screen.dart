import 'package:flutter/material.dart';
import 'package:transport/constants/utils/utils.dart';
import 'package:transport/screens/home_screen/home_screen.dart';

import '../../constants/utils/colors_package.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  int? selectedvalue = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedvalue = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // APPBAR
            Container(
              margin: const EdgeInsets.fromLTRB(20,5,20,0),
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Profile Setup',
                        style: TextStyle(
                            fontSize: 26
                        ),
                      ),
                      // SizedBox(height: 2),
                      Text('Please set your profile to get started',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13
                        ),
                      )
                    ],
                  ),
                 // Expanded(child: Container()),
                 Image(
                   fit: BoxFit.fill,
                   image: AssetImage('assets/images/anygari.png'),
                   width: 75,
                   height: 75,
                 )
                ],
              ),
            ),

            // UPLOAD IMAGE, PROFILE SETUP FORM,  RADIO BUTTON
            Column(
              children: [
                // UPLOAD IMAGE
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(69.0),
                      border: Border.all(
                          color: Colors.grey.shade300,
                          width: 0.8
                      ),
                    image: const DecorationImage(
                      alignment: Alignment.center,
                      scale: 4.5,
                      image: AssetImage('assets/images/upload.png'),
                    )
                  ),
                ),
                const SizedBox(height: 10),

                // PROFILE SETUP FORM
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputTextLabel.nameofText('Name'),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 20),
                          child: ProfileSetupInputField.nameofTextField(
                              TextInputType.text,
                              nameController,
                              'Eg: Nakul Kumar',
                              'Enter your name'
                          ),
                        ),

                        InputTextLabel.nameofText('Mobile Number'),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 20),
                          child: ProfileSetupInputField.nameofTextField(
                              TextInputType.phone,
                              mobileController,
                              '+91 333 333 3333',
                              'Enter your mobile number'
                          ),
                        ),

                        OptionalInputTextLabel.nameofText('E-mail'),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 20),
                          child: ProfileSetupInputField.nameofTextField(
                              TextInputType.emailAddress,
                              emailController,
                              'Eg: example@email.com',
                              'Enter your email Address'
                          ),
                        ),

                        OptionalInputTextLabel.nameofText('Address'),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 20),
                          child: DyInputField.nameofDyInputField(
                              TextInputType.streetAddress,
                              4,
                              addressController,
                              'Enter your Address',
                              null
                          ),
                        ),

                        OptionalInputTextLabel.nameofText('Date of Birth'),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 20),
                          child: DateTextField.nameofTextField(
                              dobController,
                              '12-09-2022'
                          ),
                        ),
                      ],
                    ),
                  ),

                ),

                // RADIO BUTTON
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 0.8,
                      child: Radio<int>(
                        value: 0,
                        toggleable: true,
                        activeColor: MaterialStateColor.resolveWith((states) => PrimaryColor),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        groupValue: selectedvalue,
                        onChanged: (value){
                          setState(() {
                            selectedvalue = value;
                            print(value);
                          });
                        },
                      ),
                    ),
                    RichText(
                        text: const TextSpan(
                            children: [
                              TextSpan(text: 'Agreed to ',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Poppins',
                                    fontSize: 10
                                ),
                              ),
                              TextSpan(text: 'Term & Conditions',
                                style: TextStyle(
                                    color: PrimaryColor,
                                    fontFamily: 'Poppins',
                                    decoration: TextDecoration.underline,
                                    fontSize: 10
                                ),
                              ),
                              TextSpan(text: ' & ',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Poppins',
                                    fontSize: 10
                                ),
                              ),
                              TextSpan(text: 'Privacy Policy',
                                style: TextStyle(
                                    color: PrimaryColor,
                                    fontFamily: 'Poppins',
                                    decoration: TextDecoration.underline,
                                    fontSize: 10
                                ),
                              )
                            ]
                        )
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),

      // SUBMIT BUTTON
      bottomNavigationBar: PrimaryBottomButton.nameofPrimaryButton(context, 'SUBMIT', (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
      ),
    );
  }
}

