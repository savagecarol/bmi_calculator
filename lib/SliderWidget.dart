import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  final Function(int) onChange;
  final double min;
  final double max;
  final String unit;
  final Color sliderColor;
  final Color thumbColor;
  final Color valueColor;
  final Color sliderInavticeColor;
  String value;

  SliderWidget(
      {Key? key,
      required this.onChange,
      required this.min,
      required this.max,
      required this.unit,
      required this.value,
      required this.valueColor,
      required this.sliderColor,
      required this.thumbColor, required this.sliderInavticeColor})
      : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              widget.value,
              style: TextStyle(
                  fontSize: 18,
                  color: widget.valueColor,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(right: 16, left: 8),
              child: Text(
                widget.unit,
                style: TextStyle(
                    fontSize: 18,
                    color: widget.valueColor,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Slider(
          min: widget.min,
          max: widget.max,
          value: double.parse(widget.value),
          thumbColor: widget.thumbColor,
          activeColor: widget.sliderColor,
          inactiveColor: widget.sliderInavticeColor,
          onChanged: (value) {
            setState(() {
              widget.value = value.toInt().toString();
            });
            widget.onChange(int.parse(widget.value));
          },
        )
      ],
    );
  }
}
