import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lunar_clock/controller/calendar_controller.dart';
import 'package:lunar_clock/value/value.dart';
import 'package:lunar_clock/view/lunar_calendar.dart';

void main() {
  runApp(const MyApp());
  // Get.put(MyController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MaterialApp(
        title: '老黄历',
        debugShowCheckedModeBanner: false,
        theme: light_theme,
        builder: (context, widget) {
          ScreenUtil.setContext(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        // home: AlarmView(),
        // home: ClockView(),
        home: LunarCalendar(),
      ),
    );
  }
}
