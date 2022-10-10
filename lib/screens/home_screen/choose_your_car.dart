import 'package:flutter/material.dart';

import '../vehicle_info/vehicle_info_screen.dart';
import 'home_component.dart';


class ChooseCarUI extends StatefulWidget {
  const ChooseCarUI({Key? key}) : super(key: key);

  @override
  State<ChooseCarUI> createState() => _ChooseCarUIState();
}

class _ChooseCarUIState extends State<ChooseCarUI> {
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
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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