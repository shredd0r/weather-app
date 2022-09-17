import 'package:flutter/material.dart';

class SeparatorWidget extends StatelessWidget {

  final double height;

  const SeparatorWidget({Key? key, this.height = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Container(height: height, color: Colors.black));
  }
}