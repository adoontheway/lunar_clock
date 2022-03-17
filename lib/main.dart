import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunar_clock/utils/util.dart';
import 'package:lunar_clock/value/value.dart';
import 'package:lunar_clock/view/lunar_calendar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDio().then((value) {
    if (value) {
      runApp(const MyApp());
    } else {
      if (kDebugMode) {
        print("网络连接出现异常，请检查网络设置");
      }
      exit(111);
    }
  });

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
        locale: const Locale("zh", "CN"),
        supportedLocales: const [
          Locale("zh", "CN"),
          // Locale("en", "US"),
        ],
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
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
