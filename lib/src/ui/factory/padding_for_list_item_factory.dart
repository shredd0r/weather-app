import 'package:flutter/material.dart';

class PaddingForListItemFactory {

  static Widget getWidgetWithPadding(Widget widgetForSetPadding, List<Widget> listOfWidgetForListView, double paddingSize) {
    int index = listOfWidgetForListView.indexOf(widgetForSetPadding);

    if (index == 0) {
      return Padding(
          padding: EdgeInsets.only(right: paddingSize),
          child: widgetForSetPadding
      );
    }

    if (index == listOfWidgetForListView.length - 1) {
      return Padding(
          padding: EdgeInsets.only(left: paddingSize),
          child: widgetForSetPadding
      );
    }

    return Padding(
        padding: EdgeInsets.only(left: paddingSize, right: paddingSize),
        child: widgetForSetPadding
    );
  }
}