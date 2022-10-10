import 'package:flutter/material.dart';

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
  static GestureDetector nameofVehicleGridView(context,PageName, image, labelText) => GestureDetector(
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

