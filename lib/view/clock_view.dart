import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lunar_clock/utils/util.dart';

class ClockView extends StatefulWidget {
  ClockView({Key? key}) : super(key: key);

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    Screen.init();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          painter: CustomClock(),
        ),
      ),
    );
  }
}

class CustomClock extends CustomPainter {
  Paint _bigCirclePaint = Paint()
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true
    ..color = Colors.deepOrange
    ..strokeWidth = 4;

  Paint _linePaint = Paint()
    ..style = PaintingStyle.fill
    ..isAntiAlias = true
    ..color = Colors.deepOrange
    ..strokeWidth = 4;

  Offset _centerOffset = Offset(0, 0);
  double _bigRadius = min(Screen.screenHeightDp / 3, Screen.screenWidthDp / 3);
  final int lineHeight = 10;
  List<TextPainter> _textPaints = [
    _getTextPainter('12'),
    _getTextPainter('3'),
    _getTextPainter('6'),
    _getTextPainter('9'),
  ];

  // 文字画笔
  TextPainter _textPainter = new TextPainter(
    textAlign: TextAlign.left,
    textDirection: TextDirection.ltr,
  );

  @override
  void paint(Canvas canvas, Size size) {
    // 画大圆
    canvas.drawCircle(_centerOffset, _bigRadius, _bigCirclePaint);
    // 绘制圆心
    _bigCirclePaint.style = PaintingStyle.fill;
    canvas.drawCircle(_centerOffset, _bigRadius / 20, _bigCirclePaint);
    // 绘制刻度
    for (int i = 0; i < 60; i++) {
      _linePaint.strokeWidth = i % 5 == 0 ? (i % 3 == 0 ? 10 : 4) : 1;
      canvas.drawLine(Offset(0, _bigRadius - lineHeight), Offset(0, _bigRadius),
          _linePaint);
      canvas.rotate(pi / 30);
    }
    // 绘制数字
    DateTime now = DateTime.now();
    int hour = now.hour;
    int minute = now.minute;
    int second = now.second;
    double hourAngle = (minute / 60 + hour - 12) * pi / 6;
    double minuteAngle = (minute + second / 60) * pi / 30;
    double secondAngle = second * pi / 60;
    _linePaint.strokeWidth = 4;
    canvas.rotate(hourAngle);
    canvas.drawLine(Offset(0, 0), Offset(0, -_bigRadius + 80), _linePaint);

    _linePaint.strokeWidth = 2;
    canvas.rotate(minuteAngle - hourAngle);
    canvas.drawLine(Offset(0, 0), Offset(0, -_bigRadius + 60), _linePaint);

    _linePaint.strokeWidth = 1;
    canvas.rotate(secondAngle - minuteAngle);
    canvas.drawLine(Offset(0, 0), Offset(0, -_bigRadius + 30), _linePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  static TextPainter _getTextPainter(String msg) {
    return new TextPainter(
      text: TextSpan(
        style: TextStyle(
          color: Colors.deepOrange,
          fontSize: 22,
        ),
        text: msg,
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
  }
}
