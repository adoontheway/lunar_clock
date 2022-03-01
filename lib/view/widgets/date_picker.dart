import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildPickerHeader() {
  return Container(
    width: ScreenUtil().uiSize.width, //MediaQuery.of(context).size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            print("点击了阳历按钮");
          },
          child: Text("阳历"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              return Colors.orange;
            }),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            print("点击了阴历按钮");
          },
          child: const Text("阴历"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              return Colors.blue;
            }),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            print("点击了今日按钮");
          },
          child: Text("今日"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              return Colors.green;
            }),
          ),
        ),
      ],
    ),
  );
}
