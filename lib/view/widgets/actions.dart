import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lunar_clock/value/value.dart';
import 'package:lunar_clock/view/widgets/widgets.dart';

Widget buildShareButton(BuildContext context) {
  return IconButton(
    onPressed: () {
      // Navigator.of(context).push(CalendarChoseView());
      // Get.to(CalendarChoseView());
    },
    icon: Icon(
      Ionicons.share_social,
      color: white_primary,
    ),
  );
}

Widget buildCalendatChoseButton(
    BuildContext context, ValueChanged<DateTime> onDateSelected) {
  return IconButton(
    onPressed: () {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    height: 55.0,
                    child: Container(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Color(0xffcccccc),
                        ),
                        color: Colors.white,
                      ),
                      child: buildPickerHeader(),
                    ),
                  ),
                  CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    minimumDate: DateTime(1990, 1, 1),
                    maximumDate: DateTime(2022, 12, 30),
                    initialDateTime: DateTime.now(),
                    dateOrder: DatePickerDateOrder.ymd,
                    onDateTimeChanged: onDateSelected,
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
    icon: Icon(
      Ionicons.calendar_outline,
      color: white_primary,
    ),
  );
}
