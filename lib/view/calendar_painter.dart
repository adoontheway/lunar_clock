import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:lunar_clock/model/date_entity.dart';
import 'package:lunar_clock/utils/util.dart';
import 'package:lunar_clock/value/value.dart';

class CalendarPainter extends CustomPainter {
  // 所选日期数据
  DateEntity dateEntity;
  // 所选日期
  DateTime now;
  // 星座图片
  ui.Image xingzuoPic;
  // 背景画笔
  late Paint bgPaint;
  CalendarPainter({
    required this.dateEntity,
    required this.now,
    required this.xingzuoPic,
  }) {
    init();
  }

  void init() {
    bgPaint = new Paint();
    bgPaint.color = Colors.grey;
  }

  bool shouldRepaint(CustomPainter painter) => true;

  void paint(Canvas canvas, Size size) {
    canvas.saveLayer(
      Rect.fromLTRB(0, 0, size.width, size.height),
      bgPaint,
    );
    canvas.restore();
    _drawBigDate(canvas);
    canvas.save();
    // _drawFestive(canvas);
    // canvas.restore();
    _drawWeek(canvas);
    canvas.restore();
    _drawRow1(canvas);
    canvas.save();
  }

  void _drawBigDate(Canvas canvas) {
    final textStyle = TextStyle(
      color: red_primary,
      fontWeight: FontWeight.bold,
      fontSize: 120,
    );
    final textSpan = TextSpan(
      text: now.day.toString(),
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    final offset = Offset(120, 10);
    textPainter.layout();
    textPainter.paint(canvas, offset);
  }

  void _drawFestive(Canvas canvas) {}
  void _drawWeek(Canvas canvas) {
    final textStyle = TextStyle(
      color: red_primary,
      fontWeight: FontWeight.w400,
      fontSize: 24,
    );
    final textSpan = TextSpan(
      text: dateEntity.gongLi.split(" ")[1],
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    final offset = Offset(320, 140);
    textPainter.layout();
    textPainter.paint(canvas, offset);
  }

  void _drawRow1(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTRB(5, 180, 415, 280),
      Paint()
        ..color = red_primary
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke,
    );
    canvas.drawImage(
      this.xingzuoPic,
      Offset(12, 196),
      Paint()..isAntiAlias = true,
    );
    _drawLunarDate(canvas);
    // _drawJieQi(canvas);
  }

  void _drawLunarDate(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTRB(80, 180, 335, 280),
      Paint()..color = red_primary,
    );
    TextStyle textStyle = TextStyle(
      color: white_primary,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
    TextSpan textSpan = TextSpan(
      text: dateEntity.ganZhi.split(" ")[0] +
          " " +
          dateEntity.nongLi.split(" ")[1],
      style: textStyle,
    );
    TextPainter textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    Offset offset = Offset(115, 185);
    textPainter.layout();
    textPainter.paint(canvas, offset);
    canvas.restore();

    textStyle = TextStyle(
      color: white_primary,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
    textSpan = TextSpan(
      text: dateEntity.jieQi.split(" ")[0],
      style: textStyle,
    );
    textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    offset = Offset(90, 350);
    textPainter.layout();
    textPainter.paint(canvas, offset);
    canvas.restore();
  }

  void _drawJieQi(Canvas canvas) {
    canvas.save();
    canvas.drawRect(
      Rect.fromLTRB(228, 288, 350, 380),
      Paint()..color = red_primary,
    );
    canvas.restore();
    TextStyle textStyle = TextStyle(
      color: white_primary,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
    TextSpan textSpan = TextSpan(
      text: dateEntity.jieQi, //.split(" ")[0],
      style: textStyle,
    );
    TextPainter textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    Offset offset = Offset(225, 290);
    textPainter.layout();
    textPainter.paint(canvas, offset);
    canvas.restore();

    // textStyle = TextStyle(
    //   color: white_primary,
    //   fontWeight: FontWeight.bold,
    //   fontSize: 20,
    // );
    // textSpan = TextSpan(
    //   text: dateEntity.jieQi.split(" ")[1],
    //   style: textStyle,
    // );
    // textPainter = TextPainter(
    //   text: textSpan,
    //   textDirection: TextDirection.ltr,
    //   textAlign: TextAlign.center,
    // );
    // offset = Offset(220, 330);
    // textPainter.layout();
    // textPainter.paint(canvas, offset);
    // canvas.restore();
  }
}
