import 'package:flutter/material.dart';
import 'package:transport/screens/home_screen/home_component.dart';

import '../../constants/utils/colors_package.dart';
import '../../constants/utils/custom_appbar.dart';
import '../../constants/utils/utils.dart';
import 'choose_your_car.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                
                // APPBAR
                HomeAppBar(context),

                // OFFERS & PROMO
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Section.nameofSection(context, 'assets/images/home_screen/offers.png', 'OFFERS'),
                    Section.nameofSection(context, 'assets/images/home_screen/promo.png', 'PROMO'),
                  ],
                ),
                const SizedBox(height: 10,),

                // CHOOSE CAR
                ChooseCarUI()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: HomeNavBar(context)
    );
  }
}

