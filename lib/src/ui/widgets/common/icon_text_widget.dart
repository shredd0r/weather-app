import 'package:flutter/material.dart';
import 'package:weather_app/src/static/constants.dart';

class IconText extends StatelessWidget {

  final String text;
  final IconData icon;
  final double size;

  const IconText(this.text, this.icon, {this.size = ConstantUI.textDayOfWeekFontSize, Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: size),
        Text(text, style: TextStyle(fontSize: size))
      ],
    );
  }

}