import 'dart:math';

import 'package:bmi_calculator/GenderWidget.dart';
import 'package:bmi_calculator/HeightWidget.dart';
import 'package:bmi_calculator/ScoreScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {

    int _gender = 0;
  int _height = 150;
  int _age = 30;
  int _weight = 50;
  bool _isFinished = false;
  double _bmiScore = 0;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                   const Text("Gender",
                    style: TextStyle(fontSize: 25, color: Colors.black),),
                  SizedBox(height:16.h),
                    GenderWidget(
                    onChange: (genderVal) {
                      _gender = genderVal;
                    },
                  ),
                  SizedBox(height:16.h),
                  const Text("Age",
                    style: TextStyle(fontSize: 25, color: Colors.black),),
                  SizedBox(height:16.h),
                SliderWidget(onChange: ( heightVal ) { 
                    _height = heightVal;
                   }, initilaValue: '18', max: 120, min: 0, unit: 'year',
                   ),
                  SizedBox(height:16.h),
                  const Text("Height",
                    style: TextStyle(fontSize: 25, color: Colors.black),),
                  SizedBox(height:16.h),
                SliderWidget(onChange: ( heightVal ) { 
                    _height = heightVal;
                   }, initilaValue: '140', max: 240, min: 10, unit: 'cm',
                   ),
                  SizedBox(height:16.h),
                 const Text("Weight",
                    style: TextStyle(fontSize: 25, color: Colors.black),),
                  SizedBox(height:16.h),
                    SliderWidget(onChange: ( weightVal ) { 
                    _height = weightVal;
                   }, initilaValue: '45', max: 200, min: 4, unit: 'kg',
                   ),   

                    Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 60),
                    child: SwipeableButtonView(
                        isFinished: _isFinished,
                        onFinish: () async {
                          await Navigator.push(
                              context,
                              PageTransition(
                                  child: ScoreScreen(
                                    bmiScore: _bmiScore,
                                    age: _age,
                                  ),
                                  type: PageTransitionType.fade));

                          setState(() {
                            _isFinished = false;
                          });
                        },
                        onWaitingProcess: () {
                          //Calculate BMI here
                          calculateBmi();

                          Future.delayed(Duration(seconds: 1), () {
                            setState(() {
                              _isFinished = true;
                            });
                          });
                        },
                        activeColor: Colors.blue,
                        buttonWidget: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                        buttonText: "CALCULATE"),
                  )     
              ],
            ),
          ),
        ),
      );
    });
  }

    void calculateBmi() {
    _bmiScore = _weight / pow(_height / 100, 2);
  }
}
