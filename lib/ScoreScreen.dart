import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

class ScoreScreen extends StatelessWidget {
  final double bmiScore;
  final int age;
  String? bmiStatus;
  String? bmiInterpretation;
  Color? bmiStatusColor;

  ScoreScreen({Key? key, required this.bmiScore, required this.age})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Text(
                  "Score",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 64,
                ),
                PrettyGauge(
                  gaugeSize: 280.h,
                  minValue: 0,
                  maxValue: 40,
                  startMarkerStyle:
                      const TextStyle(color: Colors.white, fontSize: 16),
                  endMarkerStyle:
                      const TextStyle(color: Colors.white, fontSize: 16),
                  segments: [
                    GaugeSegment('UnderWeight', 18.5, Colors.red),
                    GaugeSegment('Normal', 6.4, Colors.green),
                    GaugeSegment('OverWeight', 5, Colors.orange),
                    GaugeSegment('Obese', 10.1, Colors.pink),
                  ],
                  valueWidget: Text(
                    bmiScore.toStringAsFixed(1),
                    style: const TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  currentValue: bmiScore.toDouble(),
                  needleColor: Colors.white,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  bmiStatus!,
                  style: TextStyle(
                      fontSize: 26,
                      color: bmiStatusColor!,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  bmiInterpretation!,
                  style: const TextStyle(fontSize: 18, color: Colors.white , fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 64
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                               color: Colors.white30,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8 , horizontal: 16),
                          child: const Center(child: Text("Re-calculate" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w800 , fontSize: 22),))
                          )
                        ),
                    const SizedBox(
                      width: 10,
                    ),
           
                  ],
                )
              ])),
        ),
      floatingActionButton:   FloatingActionButton(onPressed: () {
                        Share.share(
                            "Your BMI is ${bmiScore.toStringAsFixed(1)} at age $age");
                      } , 
                      backgroundColor: Colors.white30,
                      child: const Icon(Icons.share)
                      )
                      ,
      );
    });
  }

  void setBmiInterpretation() {
    if (bmiScore > 30) {
      bmiStatus = "Obese";
      bmiInterpretation = "Please work to reduce obesity";
      bmiStatusColor = Colors.pink;
    } else if (bmiScore >= 25) {
      bmiStatus = "Overweight";
      bmiInterpretation = "Do regular exercise & reduce the weight";
      bmiStatusColor = Colors.orange;
    } else if (bmiScore >= 18.5) {
      bmiStatus = "Normal";
      bmiInterpretation = "Enjoy, You are fit";
      bmiStatusColor = Colors.green;
    } else if (bmiScore < 18.5) {
      bmiStatus = "Underweight";
      bmiInterpretation = "Try to increase your weight";
      bmiStatusColor = Colors.red;
    }
  }
}
