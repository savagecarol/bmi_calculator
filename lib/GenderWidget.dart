import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderWidget extends StatefulWidget {
  final Function(int) onChange;

  const GenderWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  _GenderWidgetState createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  int _gender = 0;

  final ChoiceChip3DStyle selectedStyle =
      const ChoiceChip3DStyle(topColor:Colors.white);

  final ChoiceChip3DStyle unselectedStyle = const ChoiceChip3DStyle(
      topColor: Color.fromARGB(255, 73, 71, 71));

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ChoiceChip3D(
              height: 160.h,
              width: 130.w,
              style: _gender == 1 ? selectedStyle : unselectedStyle,
              onSelected: () {
                setState(() {
                  _gender = 1;
                });
                widget.onChange(_gender);
              },
              onUnSelected: () {},
              selected: _gender == 1,
              child: Container(
                      padding: const EdgeInsets.all(16),
                child: Image.asset(
                  "assets/images/man.png",
                  height: 200.r,
                ),
              )),
          ChoiceChip3D(
              height: 160.h,
              width: 130.w,
              style: _gender == 2 ? selectedStyle : unselectedStyle,
              onSelected: () {
                setState(() {
                  _gender = 2;
                });
                widget.onChange(_gender);
              },
              selected: _gender == 2,
              onUnSelected: () {},
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Image.asset(
                  "assets/images/woman.png",
                  height: 200.h,
                ),
              ))
        ],
      );
    });
  }
}
