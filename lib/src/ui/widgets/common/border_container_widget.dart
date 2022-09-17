
import 'package:flutter/material.dart';

class BorderContainerWidget extends StatelessWidget {

  final Widget child;
  final double? height;
  final double? width;
  final double innerPadding;
  final double outerPadding;

  const BorderContainerWidget({
    required this.child,
    this.innerPadding = 15,
    this.outerPadding = 15,
    this.height,
    this.width,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: outerPadding, right: outerPadding),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black)
        ),
        padding: EdgeInsets.all(innerPadding),
        child: child)
    );
  }

}