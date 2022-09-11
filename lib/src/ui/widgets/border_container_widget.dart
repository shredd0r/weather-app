
import 'package:flutter/material.dart';

class BorderContainerWidget extends StatelessWidget {

  final Widget child;
  final double? height;
  final double? width;

  const BorderContainerWidget({required this.child, this.height, this.width, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(   //TODO change to Expanded
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black)
        ),
        padding: const EdgeInsets.all(15),
        child: child)
    );
  }

}