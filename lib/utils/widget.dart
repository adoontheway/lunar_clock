import 'package:flutter/material.dart';

Widget btnCircle(String label, double radius, void Function() pressHandler) {
  return SizedBox(
    width: radius * 2,
    height: radius * 2,
    child: TextButton(
      child: Text(label),
      onPressed: pressHandler,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(CircleBorder()),
      ),
    ),
  );
}

Widget labCirle(
    {required String label,
    double? radius,
    Color? textColor,
    Color? backgroundColor}) {
  textColor ??= Colors.white;
  backgroundColor ??= Colors.blue;
  radius ??= 70;
  return Container(
    width: radius * 2,
    height: radius * 2,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: backgroundColor,
    ),
    child: Container(
      margin: const EdgeInsets.all(5),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
