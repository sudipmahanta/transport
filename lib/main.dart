
import 'package:flutter/material.dart';
import 'package:transport/constants/utils/utils.dart';
import 'package:transport/screens/landing_screen.dart';

import 'constants/utils/colors_package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            color: TextColor,
          ),
            headline2: TextStyle(
                color: TextColor
            ),
          bodyText1: TextStyle(
            color: TextColor
          )
        ),
        fontFamily: 'Poppins',
        scaffoldBackgroundColor:  BackGroundColor
      ),
      home: LandingScreen(),
    );
  }
}
