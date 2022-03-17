import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

Future<ui.Image> getAssetImage(String asset, {width, height}) async {
  ByteData data = await rootBundle.load(asset);
  ui.Codec codec = await ui.instantiateImageCodec(
    data.buffer.asUint8List(),
    targetHeight: height,
    targetWidth: width,
  );
  ui.FrameInfo info = await codec.getNextFrame();
  return info.image;
}
