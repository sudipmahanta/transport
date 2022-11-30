import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:transport/constants/utils/utils.dart';
import 'package:transport/screens/home/home_screen.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Rate your trip',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Text('How was your trip',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                    ),
                  ),
                  SizedBox(height: 15),

                  RatingBar.builder(
                    glow: false,
                    unratedColor: Colors.grey.shade300,
                    itemBuilder: (BuildContext context, int index) => Icon(Icons.star,color: Colors.amberAccent,),
                    onRatingUpdate: (rating) {  },
                  ),
                  SizedBox(height: 30),

                  Container(
                    width: deviceWidth,
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Message (Optional)',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14
                          ),
                        ),
                        TextField(
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(
                                color: Color(0xFF666666),
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0
                            ),
                            contentPadding: const EdgeInsets.all(20.0),
                            enabledBorder:  const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0XFF999999)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color:Color(0XFF999999)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                        ConstrainedBox(
                            constraints: BoxConstraints.tightFor(width: deviceWidth, height: 55),
                          child: PrimaBottomButton.nameofPrimaryButton(context, 'Submit', (){}),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
