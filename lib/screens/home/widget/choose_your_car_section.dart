import 'package:flutter/material.dart';

import '../../vehicle_info/vehicle_info_screen.dart';


class ChooseYourCar extends StatefulWidget {
  const ChooseYourCar({Key? key}) : super(key: key);

  @override
  State<ChooseYourCar> createState() => _ChooseYourCarState();
}

class _ChooseYourCarState extends State<ChooseYourCar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Text[Choose Car]
        const Text('Choose Your car',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 20),

        // List of All Vehicle
        GridView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 50,
              mainAxisSpacing: 5,
              childAspectRatio: 180/260
          ),
          children: [
            VehicleGridView.nameofVehicleGridView(context, VehicleDetailScreen(title: 'Car'), 'assets/images/home_screen/car_line.png', 'Car'),
            VehicleGridView.nameofVehicleGridView(context, VehicleDetailScreen(title: 'Bus'), 'assets/images/home_screen/bus_line.png', 'Bus'),
            VehicleGridView.nameofVehicleGridView(context, VehicleDetailScreen(title: 'Mini'), 'assets/images/home_screen/mini_van_line.png', 'Mini Van'),
            VehicleGridView.nameofVehicleGridView(context, VehicleDetailScreen(title: 'Car'),'assets/images/home_screen/car_line.png', 'Car'),
            VehicleGridView.nameofVehicleGridView(context, VehicleDetailScreen(title: 'Bus'),'assets/images/home_screen/bus_line.png', 'Bus'),
            VehicleGridView.nameofVehicleGridView(context, VehicleDetailScreen(title: 'Mini'),'assets/images/home_screen/mini_van_line.png', 'Mini Van'),
            VehicleGridView.nameofVehicleGridView(context, VehicleDetailScreen(title: 'Car'),'assets/images/home_screen/car_line.png', 'Car'),
            VehicleGridView.nameofVehicleGridView(context, VehicleDetailScreen(title: 'Bus'),'assets/images/home_screen/bus_line.png', 'Bus'),
            VehicleGridView.nameofVehicleGridView(context, VehicleDetailScreen(title: 'Mini'),'assets/images/home_screen/mini_van_line.png', 'Mini Van'),
          ],
        ),
      ],
    );
  }
}


class Section {
  static SizedBox nameofSection(context, image, labelText) => SizedBox(
    height: 80,
    width: 135,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 33,
          height: 33,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(69.0),
              border: Border.all(
                  color: Colors.grey.shade300,
                  width: 0.8
              )
          ),
          child: ClipRRect(
            child: Image(
              image: AssetImage(image),
              width: 20,
              height: 11,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(width: 10,),
        Text(labelText,
          style: TextStyle(
              fontSize: 16,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w800,
              color: Colors.black
          ),
        )
      ],
    ),
  );
}

class VehicleGridView {
  static GestureDetector nameofVehicleGridView(context, PageName, image, labelText) => GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PageName));
    },
    child: SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            padding: EdgeInsets.all(19),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60.0),
              border: Border.all(
                  color: Colors.grey.shade400,
                  width: 0.8
              ),
            ),
            child: Image(
              color: Colors.black,
              image: AssetImage(image),
              width: 24,
              height: 24,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 5),
          Text('$labelText'),
        ],
      ),
    ),
  );
}

