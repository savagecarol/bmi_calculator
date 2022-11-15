import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  final Function(int) onChange;
  final double min;
  final double max;
  final String unit;
  String initilaValue;

  SliderWidget(
      {Key? key,
      required this.onChange,
      required this.min,
      required this.max,
      required this.unit , 
      required this.initilaValue})
      : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(),
        child: Container(
          padding: const EdgeInsets.only(left: 8 , right: 8 , top: 16 , bottom: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.initilaValue,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.unit,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Slider(
                min: widget.min,
                max: widget.max,
                value: double.parse(widget.initilaValue),
                thumbColor: Colors.pink,
                onChanged: (value) {
                  setState(() {
                    widget.initilaValue = value.toInt().toString();
                  });
                  widget.onChange(int.parse(widget.initilaValue));
                },
              )
            ],
          ),
        ));
  }
}
