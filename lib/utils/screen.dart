import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class Screen {
  static final double width = 1080;

  static final double height = 1920;
  static final bool allowFontScaling = false;

  /// 当前设备宽度 dp
  static late double _screenWidthDp;
  static double get screenWidthDp => _screenWidthDp;
  static late double _screenHeightDp;
  static double get screenHeightDp => _screenHeightDp;

  /// 设备的像素密度
  static late double _screenPixelRatio;
  static double get screenPixelRatio => _screenPixelRatio;

  /// 状态栏高度 dp，刘海平会更高
  static late double _topSafeHeight;
  static double get topSafeHeight => _topSafeHeight;

  /// 底部安全区距离 dp
  static late double _bottomSafeHeight;
  static double get bottomSafeHeight => _bottomSafeHeight;

  /// 每个逻辑像素的字体像素数，字体的缩放比例
  static late double _textScaleFactor;
  static double get textScaleFactor => _textScaleFactor;

  /// Toolbar height
  static double get toolBarHeight => kToolbarHeight;

  /// ToolBarHeight + status height
  static double get navigatorBarHeight => _topSafeHeight + toolBarHeight;

  /// 实际dp与设计稿px的比例
  static get scaleWidth => _screenWidthDp / width;
  static get scaleHeight => _screenHeightDp / height;

  /// 根据设计稿的设备宽度匹配
  static setWidth(double width) => width * scaleWidth;

  /// 根据设计稿的设备高度匹配
  /// 当发现设计稿中的一屏显示与当前样式效果不符合时，
  /// 或者形状有差异时，高度适配建议使用此方法
  /// 高度适配住要针对想根据设计稿的一屏展示一样的效果
  static setHeight(double height) => height * scaleHeight;

  /// 字体大小适配方法
  /// @param fontSize 传入设计稿上的字体px
  /// allowFontScaling 控制字体是否需要根据系统的‘字体大小’辅助选项来进行缩放，默认false
  static setSp(double fontSize) => allowFontScaling
      ? setWidth(fontSize)
      : setWidth(fontSize) / _textScaleFactor;

  static void init() {
    MediaQueryData queryData = MediaQueryData.fromWindow(ui.window);
    _screenWidthDp = queryData.size.width;
    _screenHeightDp = queryData.size.height;
    _screenPixelRatio = queryData.devicePixelRatio;
    _topSafeHeight = queryData.padding.top;
    _bottomSafeHeight = queryData.padding.bottom;
    _textScaleFactor = queryData.textScaleFactor;
  }
}
