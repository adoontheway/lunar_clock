class CalPoint {
  CalPoint();

  CalPoint.data(this.x, this.y);

  double? x = -1;
  double? y = -1;
}

///触摸类型
enum PositionStyle {
  STYLE_TOP_RIGHT,
  STYLE_LOWER_RIGHT,
  STYLE_LEFT,
  STYLE_RIGHT,
  STYLE_MIDDLE,
}
