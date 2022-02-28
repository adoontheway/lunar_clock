import 'package:flutter/material.dart';
import 'package:lunar_clock/model/date_entity.dart';
import 'package:lunar_clock/provider/calendar_provider.dart';
import 'package:lunar_clock/value/const.dart';

class CalendarModel extends ChangeNotifier {
  late DateEntity _dateEntity;
  DateEntity get dateEntity => _dateEntity;
  CalendarProvider calendar_provider = CalendarProvider();
  CalendarModel() {
    init();
  }

  void init() {
    DateTime day = DateTime.now();
    getDay(date_format.format(day));
  }

  void getDay(String dayStr) {
    calendar_provider.getDay(dayStr).then((value) {
      _dateEntity = value;
      notifyListeners();
    });
  }
}
