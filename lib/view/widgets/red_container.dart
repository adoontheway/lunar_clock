import 'package:flutter/material.dart';
import 'package:lunar_clock/value/colors.dart';

Container get_red_container(Widget child, {double? width, double? height}) {
  return Container(
    width: width,
    height: height,
    child: child,
    decoration: BoxDecoration(border: Border.all(width: 1, color: red_primary)),
  );
}

Widget get_title({
  required String label,
  double? width,
  double? height,
  Color? textColor,
  Color? backgroundColor,
}) {
  textColor ??= Colors.white;
  backgroundColor ??= Colors.blue;
  width ??= 94;
  height ??= 26;
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      color: backgroundColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Container(
      // margin: const EdgeInsets.only(top: 2),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          // fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
