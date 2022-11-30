import 'package:flutter/material.dart';

import '../../../../constants/utils/colors_package.dart';
import '../../../../constants/utils/utils.dart';
import '../../confirm_pickup_loc_screen.dart';

class DivisionScreen extends StatefulWidget {
  const DivisionScreen({Key? key}) : super(key: key);

  @override
  State<DivisionScreen> createState() => _DivisionScreenState();
}

class _DivisionScreenState extends State<DivisionScreen> {

  final TextEditingController locController = TextEditingController();
  var style_val;

  @override
  Widget build(BuildContext context) {

    return SimpleDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      children: [
        Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Choose your\ndivision',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  IconButton(
                      onPressed: (){
                        Navigator.pop(context);},
                      icon: const Icon(Icons.clear_sharp,
                        size: 18,
                      )
                  )
                ],
              ),
              const SizedBox(height: 15),
              InputTextLabel.nameofText('Division'),
              DropDownButton.nameofDropDownButton(style_val, (value) {
                setState(() {
                  style_val = value;
                });
              }),
              const SizedBox(height: 15),
              InputTextLabel.nameofText('District'),
              DropDownButton.nameofDropDownButton(style_val, (value) {
                setState(() {
                  style_val = value;
                });
              }),
              const SizedBox(height: 15),
              InputTextLabel.nameofText('Thana/Upazila'),
              DropDownButton.nameofDropDownButton(style_val, (value) {
                setState(() {
                  style_val = value;
                });
              }),
              const SizedBox(height: 15),
              InputTextLabel.nameofText('Union'),
              DropDownButton.nameofDropDownButton(style_val, (value) {
                setState(() {
                  style_val = value;
                });
              }),
              const SizedBox(height: 15),
              OptionalInputTextLabel.nameofText('Comment'),
              DyInputField.nameofDyInputField(TextInputType.text, 4, locController, '', 'errorLabel'),
              const SizedBox(height: 15),
              DialogButton.nameofDialogButton(context, 'Confirm', (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ConfirmPickUpLocScreen()));
              })
            ],
          ),
      )],
    );
  }
}

class DropDownButton {
  static Container nameofDropDownButton(style_val, onChanged) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 15,),
    height: 40,
    decoration: BoxDecoration(
      border: Border.all(
          color: Color(0XFF999999)
      ),
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    ),
    child: DropdownButton(
        hint: Text('',
          style: TextStyle(
              color: Colors.grey.shade300
          ),
        ),
        itemHeight: 50,
        isExpanded: true,
        borderRadius: BorderRadius.circular(10),
        icon: Icon(Icons.keyboard_arrow_down_rounded,
          color: TextColor,
        ),
        underline: Container(height: 0),
        iconSize: 18,
        elevation: 16,
        value: style_val,
        items: <String>[
          'Divison 1',
          'Divison 2',
          'Divison 3',
          'Divison 4',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,
              style: TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
        onChanged: onChanged
    ),
  );
}

class DialogButton {
  static SizedBox nameofDialogButton(context, label, VoidCallback onPressed) =>  SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 45,
    child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.5
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0.4,
          backgroundColor: primaryColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              side: BorderSide.none
          ),
        )
    ),
  );
}