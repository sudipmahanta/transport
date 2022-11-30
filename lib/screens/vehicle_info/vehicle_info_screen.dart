import 'package:flutter/material.dart';
import 'package:transport/constants/utils/utils.dart';
import '../location/choose_location/choose_location_screen.dart';
import '../notification/notification_screen.dart';

class VehicleDetailScreen extends StatefulWidget {
  String title;
  VehicleDetailScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<VehicleDetailScreen> createState() => _VehicleDetailScreenState();
}

class _VehicleDetailScreenState extends State<VehicleDetailScreen> {

  final TextEditingController seatController= TextEditingController();
  final TextEditingController carTypeController= TextEditingController();
  final TextEditingController seatsController= TextEditingController();
  final TextEditingController acController= TextEditingController();

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [

              //APPBAR
              SizedBox(
                height: 85,
                width: deviceWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                      },
                      child: Container(
                          width: 40,
                          height: 40,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey.shade200
                          ),
                          child: const Image(
                              image: AssetImage('assets/images/notification_fill.png'))
                      ),
                    ),
                  ],
                ),
              ),

              // VEHICLE INFO FORM
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Vehicle Info',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                    VehicleInfoInputField.nameofTextField(TextInputType.number, seatController, 'No of Seats','Enter no of seats'),

                    VehicleInfoInputField.nameofTextField(TextInputType.text, carTypeController, 'Type of Car','Enter type of car'),

                    VehicleInfoInputField.nameofTextField(TextInputType.number, seatsController, 'No of Seats','Enter no of seats'),

                    VehicleInfoInputField.nameofTextField(TextInputType.text, acController, 'A/C or Non A/C','Enter A/C or Non A/C'),
                  ],
                ),
              )
            ],
          ),
        )
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BackBottomButton.nameofBackBottomButton(context),
            const SizedBox(width: 5,),
            PrimaButton.nameofPrimaryButton(context, 'CONTINUE', (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseLocationScreen()));
            })
          ],
        ),
      ),
    );
  }
}
