import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class DialPlate extends CustomPainter {
  late Paint _paintDial;
  late Paint _paintGradient;
  late double _radius;
  late double _screenWidth;
  late double _screenHeight;
  final _numPoint = 24;
  late ParagraphBuilder _timeBuilder;
  late Color _startColor;
  late Color _endColor;
  DialPlate(BuildContext context, Color startColor, Color endColor) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    _radius = _screenWidth / 100 * 37;
    _startColor = startColor;
    _endColor = endColor;
    _paintDial = Paint()
      ..isAntiAlias = true
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    var circle =
        Rect.fromCircle(center: const Offset(0, 0), radius: _screenHeight);
    var sweepGradient = SweepGradient(
      colors: [
        _startColor,
        _endColor,
      ],
    );
    _paintGradient = Paint()
      ..isAntiAlias = true
      ..shader = sweepGradient.createShader(circle)
      ..style = PaintingStyle.fill;

    _timeBuilder = ParagraphBuilder(ParagraphStyle(
      textAlign: TextAlign.center,
      fontSize: 40,
      maxLines: 1,
      fontWeight: FontWeight.bold,
    ));
  }

  @override
  void paint(Canvas canvas, Size size) {
    DateTime dateTime = DateTime.now();
    var hour = dateTime.hour;
    var minute = dateTime.minute;
    var second = dateTime.second;
    canvas.translate(_screenWidth / 2, _screenHeight / 100 * 35);
    canvas.save();
    canvas.rotate(_getRotate(second));
    canvas.drawCircle(const Offset(0, 0), _screenHeight, _paintGradient);
    canvas.restore();

    for (int i = 0; i < _numPoint; i++) {
      canvas.save();
      double deg = 360 * i / _numPoint;
      canvas.rotate(deg / 180 * pi);
      _paintDial.color = Colors.white;
      canvas.drawCircle(Offset(_radius, 0), 3, _paintDial);
      if (isShowBigCircle(hour, i)) {
        Path path = Path()
          ..addArc(Rect.fromCircle(center: Offset(_radius, 0), radius: 8), 0,
              pi * 2);
        canvas.drawShadow(path, Colors.yellow, 4, true);
        _paintDial.color = Colors.yellow;
        canvas.drawCircle(Offset(_radius, 0), 8, _paintDial);
      } else {
        _paintDial.color = Colors.white;
        canvas.drawCircle(Offset(_radius, 0), 3, _paintDial);
      }
      canvas.restore();

      canvas.save();
      _timeBuilder.addText(_getTimeStr(hour, minute));
      Paragraph paragraph = _timeBuilder.build();
      paragraph.layout(const ParagraphConstraints(width: 230));
      canvas.drawParagraph(paragraph, const Offset(-115, -42));
      canvas.restore();
    }
    // canvas.restore();
  }

  String _getTimeStr(int hour, int minute) {
    String hourStr = hour < 10 ? '0$hour' : hour.toString();
    String minuteStr = minute < 10 ? '0$minute' : minute.toString();
    return "$hourStr : $minuteStr";
  }

  bool isShowBigCircle(int hour, int i) {
    if (hour >= 12) hour = hour - 12;
    int numHour = hour * 2 + 18;
    if (numHour < 24) {
      return i == numHour;
    } else {
      return i == (numHour - 24);
    }
  }

  double _getRotate(int second) {
    return (second - 15) * pi * 2 / 60;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // throw UnimplementedError();
    return true;
  }
}
