import 'dart:math';

import 'package:bmi_calculator/GenderWidget.dart';
import 'package:bmi_calculator/SliderWidget.dart';
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
  int _height = 145;
  int _age = 30;
  int _weight = 45;
  bool _isFinished = false;
  double _bmiScore = 0;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return Scaffold(
        backgroundColor: Colors.black12,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.h),
                const Text(
                  "Gender",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.h),
                GenderWidget(
                  onChange: (genderVal) {
                    _gender = genderVal;
                  },
                ),
                SizedBox(height: 32.h),
                const Text(
                  "Age",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SliderWidget(
                    onChange: (ageVal) {
                      _age = ageVal;
                    },
                    value: '18',
                    max: 120,
                    min: 0,
                    unit: 'year',
                    thumbColor: Colors.white,
                    valueColor: Colors.white,
                    sliderColor: Colors.white,
                    sliderInavticeColor: Color.fromARGB(255, 73, 71, 71)),
                SizedBox(height: 8.h),
                const Text(
                  "Height",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SliderWidget(
                    onChange: (heightVal) {
                      _height = heightVal;
                    },
                    value: '140',
                    max: 240,
                    min: 10,
                    unit: 'cm',
                    thumbColor: Colors.white,
                    valueColor: Colors.white,
                    sliderColor: Colors.white,
                    sliderInavticeColor: Color.fromARGB(255, 73, 71, 71)),
                const Text(
                  "Weight",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SliderWidget(
                  onChange: (weightVal) {
                    _weight = weightVal;
                  },
                  value: '45',
                  max: 200,
                  min: 4,
                  unit: 'kg',
                  sliderColor: Colors.white,
                  sliderInavticeColor: Color.fromARGB(255, 73, 71, 71),
                  thumbColor: Colors.white,
                  valueColor: Colors.white,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical:16),
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
                        calculateBmi();
                          setState(() {
                            _isFinished = true;
                          });
                      },
                      activeColor: Colors.white30,
                      buttonWidget: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ),
                      buttonText: "CALCULATE" , buttontextstyle: const TextStyle(fontSize: 16 , color: Colors.white , fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  void calculateBmi() {
    print(_weight);
    print(_height);
    _bmiScore = _weight / pow(_height / 100, 2);
  }
}
