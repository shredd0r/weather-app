import 'package:flutter/material.dart';
import 'package:weather_app/src/static/constants.dart';

class SeparatorWidget extends StatelessWidget {

  final double height;

  const SeparatorWidget({Key? key, this.height = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: ConstantUI.paddingSize, bottom: ConstantUI.paddingSize),
        child: Container(height: height, color: Colors.black));
  }
}