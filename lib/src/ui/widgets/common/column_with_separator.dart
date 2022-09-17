import 'package:flutter/material.dart';

class ColumnWithSeparator extends StatelessWidget {

  late int itemCount;
  late Widget separator;
  late IndexedWidgetBuilder itemBuilder;

  ColumnWithSeparator({Key? key,
    required this.itemCount,
    required this.separator,
    required this.itemBuilder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildChildren(context),
    );
  }

  List<Widget> _buildChildren(BuildContext context) {
    List<Widget> childrenWidget = [];
    
    for(int index = 0; index < itemCount; index++) {
      childrenWidget.add(itemBuilder(context, index));

      if (index != itemCount - 1) {
        childrenWidget.add(separator);
      }
    }
    return childrenWidget;
  }
}