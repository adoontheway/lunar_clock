import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lunar_clock/const/const.dart';
import 'package:lunar_clock/model/date_entity.dart';
import 'package:lunar_clock/model/time_entity.dart';
import 'package:lunar_clock/model/time_sub_entity.dart';
import 'package:lunar_clock/utils/util.dart';
import 'package:lunar_clock/value/value.dart';
import 'package:lunar_clock/view/calendar_painter.dart';
import 'package:lunar_clock/view/widgets/widgets.dart';

class LunarCalendar extends StatefulWidget {
  LunarCalendar({Key? key}) : super(key: key);

  @override
  _LunarCalendarState createState() => _LunarCalendarState();
}

class _LunarCalendarState extends State<LunarCalendar>
    with SingleTickerProviderStateMixin {
  DateEntity? _dateEntity;
  TimeEntity? _timeEntity;
  CalPoint curPoint = CalPoint.data(-1, -1);
  CalPoint prePoint = CalPoint.data(-1, -1);

  PositionStyle style = PositionStyle.STYLE_LOWER_RIGHT;
  double? width;
  double? height;
  late AnimationController animationController;
  late Animation cancelAnim;
  late Tween<Offset?> cancelValue;
  bool needCancelAnim = true;

  DateTime _now = DateTime.now();
  late ui.Image xingZuoImage;
  getDate() async {
    String dateStr = date_format.format(_now);
    try {
      var response = await dio.get("$api_date/$dateStr");
      if (response.statusCode == HttpStatus.ok) {
        if (kDebugMode) {
          print("${response.data}");
        }
        _dateEntity = DateEntity().fromJson(response.data["day"]);
        _timeEntity = TimeEntity().fromJson(response.data["time"]);
        xingZuoImage = await getAssetImage(
          "assets/imgs/xingzuo/${xingzuo_to_res[_dateEntity!.xingZuo]}.png",
          width: 60,
          height: 60,
        );
        setState(() {});
      } else {
        print("Error on http request:${response.statusCode}");
      }
    } catch (exception) {
      print("Error on connect");
    }
  }

  @override
  void initState() {
    super.initState();
    now = DateTime.now();

    // getDate();
  }

  set now(DateTime value) {
    if (_now == value) return;
    _now = value;

    getDate();
  }

  void onDateSelected(DateTime newDate) {
    print('selected: $newDate');
    now = newDate;
  }

  toDown(TapDownDetails d) {
    prePoint = CalPoint.data(-1, -1);
    var dy = d.localPosition.dy;
    var dx = d.localPosition.dx;

    if (dx <= width! / 3) {
      //左
      style = PositionStyle.STYLE_LEFT;
    } else if (dx > width! / 3 && dy <= height! / 3) {
      //上
      style = PositionStyle.STYLE_TOP_RIGHT;
    } else if (dx > width! * 2 / 3 &&
        dy > height! / 3 &&
        dy <= height! * 2 / 3) {
      //右
      style = PositionStyle.STYLE_RIGHT;
    } else if (dx > width! / 3 && dy > height! * 2 / 3) {
      //下
      style = PositionStyle.STYLE_LOWER_RIGHT;
    } else if (dx > width! / 3 &&
        dx < width! * 2 / 3 &&
        dy > height! / 3 &&
        dy < height! * 2 / 3) {
      //中
      style = PositionStyle.STYLE_MIDDLE;
    }

    var x = d.localPosition.dx;
    var y = d.localPosition.dy;
    setState(() {
      curPoint = CalPoint.data(x, y);
    });
  }

  toNormal([_]) {
    if (needCancelAnim) {
      startCancelAnim();
    } else {
      setState(() {
        style = PositionStyle.STYLE_LOWER_RIGHT;
        prePoint = CalPoint.data(-1, -1);
        curPoint = CalPoint.data(-1, -1);
      });
    }
  }

  startCancelAnim() {
    double dx, dy;
    if (style == PositionStyle.STYLE_TOP_RIGHT) {
      dx = (width! - 1 - prePoint.x!);
      dy = (1 - prePoint.y!);
    } else if (style == PositionStyle.STYLE_LOWER_RIGHT) {
      dx = (width! - 1 - prePoint.x!);
      dy = (height! - 1 - prePoint.y!);
    } else {
      dx = prePoint.x! - width!;
      dy = -prePoint.y!;
    }
    cancelValue =
        Tween(begin: Offset(prePoint.x!, prePoint.y!), end: Offset(dx, dy));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      // drawer: Drawer(
      //   child: my_drawer(),
      // ),
      appBar: AppBar(
        title: _buildTitle(),

        // leading: _buildTotayButton(),
        actions: [
          buildCalendatChoseButton(context, onDateSelected),
          buildShareButton(context),
        ],
        // elevation: 0.5,
        backgroundColor: red_primary,
      ),
      body: _dateEntity == null
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            )
          : Container(
              width: 410.w, //ScreenUtil().setWidth(Screen.width - 20),
              margin: const EdgeInsets.all(5),
              // padding: const EdgeInsets.only(top: 5),
              child: GestureDetector(
                onTapDown: toDown,
                onTapUp: toNormal,
                // onPanEnd: toNormal,
                // onPanCancel: toNormal,
                // onPanUpdate: toDragUpdate,
                child: CustomPaint(
                    painter: CalendarPainter(
                  dateEntity: this._dateEntity!,
                  now: this._now,
                  xingzuoPic: this.xingZuoImage,
                )),
                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.start,

                //   children: [
                //     _buildBigLunarDate(),
                //     _buildWeek(),
                //     // _buildFestival(),

                //     _buildRow1(),
                //     Divider(height: 5.h,),
                //     _getYi(),
                //     Divider(height: 5.h,),
                //     _getJi(),
                //     Divider(height: 5.h,),
                //     _buildTaiShen(),
                //      Divider(height: 5.h,),
                //     _buildJiShen(),
                //      Divider(height: 5.h,),
                //     _buildShiChen(),
                //      Divider(height: 5.h,),
                //     _buildPengzu(),
                //     // _buildRow5(),
                //   ],
                // ),
              ),
            ),
    );
  }

  Widget _buildTitle() {
    return Center(
      child: Text(
        DateFormat('yyyy年MM月').format(_now),
        style: TextStyle(
          color: white_primary,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  Widget _buildLunarDate() {
    return Container(
      width: 120.w,
      height: 96.h,
      // margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(color: red_primary),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            // '辛丑年',
            _dateEntity!.ganZhi.split(" ")[0],
            style: TextStyle(
              fontSize: 20.sp,
              color: white_primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            // '十二月小',
            _dateEntity!.nongLi.split(" ")[1],
            style: TextStyle(
              fontSize: 20.sp,
              color: white_primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Text(
          //   '二十一日',
          //   style: TextStyle(
          //     fontSize: 20,
          //     color: white_primary,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildBigLunarDate() {
    return Container(
      width: 410.w, //ScreenUtil().setWidth(Screen.width - 20),
      alignment: Alignment.center,
      child: Text(
        // '15',
        _now.day.toString(),
        style: TextStyle(
          fontSize: 120.sp,
          fontWeight: FontWeight.bold,
          color: red_primary,
        ),
      ),
    );
  }

  Widget _buildWeek() {
    return Container(
      width: 410.w, //ScreenUtil().setWidth(Screen.width - 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '腊八节',
            style: TextStyle(
              fontSize: 24.sp,
              color: red_primary,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            // '星期六 第二周',
            _dateEntity!.gongLi.split(" ")[1],
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: red_primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJeiqi() {
    return Container(
      width: 142.w,
      height: 96.h,
      decoration: BoxDecoration(color: red_primary),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            // '小寒 1月5日',
            _dateEntity!.jieQi.split(" ")[0],
            style: TextStyle(
              fontSize: 20.sp,
              color: white_primary,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            // '大寒 1月20日',
            _dateEntity!.jieQi.split(" ")[1],
            style: TextStyle(
              fontSize: 20.sp,
              color: white_primary,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          // Text(
          //   '三九第二天',
          //   style: TextStyle(
          //     fontSize: 20.sp,
          //     color: white_primary,
          //     fontWeight: FontWeight.bold,
          //   ),
          //   textAlign: TextAlign.right,
          // )
        ],
      ),
    );
  }

  Widget _buildRow1() {
    return Row(
      children: [
        get_red_container(
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Image.asset(
                  // todo
                  // "assets/imgs/xingzuo/baiyang.png",
                  "assets/imgs/xingzuo/${xingzuo_to_res[_dateEntity!.xingZuo]}.png",
                  width: 60.w,
                  height: 60.h,
                ),
              ),
            ],
          ),
          width: 68.w,
          height: 96.h,
        ),
        _buildLunarDate(),
        _buildJeiqi(),
        get_red_container(
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                width: 70.w,
                child: get_title(
                  label: "日禄",
                  width: 60.w,
                  backgroundColor: red_primary,
                  textColor: white_primary,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Text(
                  // '巳命互禄',
                  _dateEntity!.riLu,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: red_primary,
                  ),
                ),
              ),
            ],
          ),
          width: 79.w,
          height: 96.h,
        ),
      ],
    );
  }

  Widget _getYi() {
    return get_red_container(
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
            margin: EdgeInsets.all(8.sp),
            child: Image.asset(
              "assets/imgs/yi.png",
            )),
        Container(
          width: 335.w,
          height: 70.h,
          margin: const EdgeInsets.all(5),
          child: Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              // '装修 动土 订婚 安葬 上梁 修造 祈福 祭祀 拆卸 订盟',
              _dateEntity!.yi,
              softWrap: true,
              style: TextStyle(
                color: green_primary,
                fontSize: 18.sp,
              ),
              maxLines: 2,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ]),
      width: 410.w,
      height: 75.h,
    );
  }

  Widget _getJi() {
    return get_red_container(
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          margin: EdgeInsets.all(8),
          child: Image.asset(
            "assets/imgs/ji.png",
          ),
        ),
        Container(
          width: 335.w,
          height: 60.h,
          margin: const EdgeInsets.all(5),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(_dateEntity!.ji,
                // '开业 开工 安床 开张 作灶 开市 立卷',
                softWrap: true,
                style: TextStyle(
                  color: red_primary,
                  fontSize: 18.sp,
                ),
                maxLines: 2,
                textAlign: TextAlign.start),
          ),
        ),
      ]),
      width: 410.w,
      height: 75.h,
    );
  }

  Widget _getWuxing() {
    return get_red_container(
      Row(
        children: [
          Container(
            width: 20,
            height: 49,
            margin: const EdgeInsets.only(left: 5),
            child: Text(
              '五行',
              style: TextStyle(
                color: green_primary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
              maxLines: 2,
            ),
          ),
          Container(
            width: 210,
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {
                0: FixedColumnWidth(20),
                1: FixedColumnWidth(20),
                2: FixedColumnWidth(20),
                3: FixedColumnWidth(20),
              },
              children: [
                TableRow(
                  children: wuxing_header
                      .map(
                        (e) => SizedBox(
                          // width: 20,
                          height: 30,
                          child: Center(
                            child: Text(
                              e,
                              style: TextStyle(
                                fontSize: 16,
                                color: green_primary,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                TableRow(
                  children: wuxing_mock
                      .map(
                        (e) => SizedBox(
                          // width: 20,
                          height: 30,
                          child: Center(
                            child: Text(
                              e,
                              style: TextStyle(
                                fontSize: 16,
                                color: red_primary,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
      width: 252,
      height: 60,
    );
  }

  Widget _buildShiChenItem(TimeSubEntity item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          // "甲",
          item.shiGanZhi.split("")[0],
          style: TextStyle(
            color: red_primary,
            fontSize: 18.sp,
          ),
        ),
        Text(
          // e,
          item.shiGanZhi.split("")[1],
          style: TextStyle(
            color: red_primary,
            fontSize: 18.sp,
          ),
        ),
        Text(
          // "吉",
          item.jiXiong.split(" ")[0],
          style: TextStyle(
            color: green_primary,
            fontSize: 18.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildShiChen() {
    return get_red_container(
      Container(
        child: Row(
          children: [
            Container(
              child: get_title(
                label: "时辰吉凶",
                textColor: white_primary,
                backgroundColor: red_primary,
                width: 85.w,
              ),
              width: 120.w,
              alignment: Alignment.center,
            ),
            Container(
              width: 280.w,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildShiChenItem(_timeEntity!.zi),
                    _buildShiChenItem(_timeEntity!.chou),
                    _buildShiChenItem(_timeEntity!.yin),
                    _buildShiChenItem(_timeEntity!.mao),
                    _buildShiChenItem(_timeEntity!.chen),
                    _buildShiChenItem(_timeEntity!.si),
                    _buildShiChenItem(_timeEntity!.wu),
                    _buildShiChenItem(_timeEntity!.wei),
                    _buildShiChenItem(_timeEntity!.shen),
                    _buildShiChenItem(_timeEntity!.you),
                    _buildShiChenItem(_timeEntity!.xu),
                    _buildShiChenItem(_timeEntity!.hai),
                  ]),
            ),
          ],
        ),
      ),
      width: 410.w,
      height: 102.h,
    );
  }

  Widget _buildPengzu() {
    return Container(
      // padding: const EdgeInsets.only(top: 10),
      width: 410.w,
      height: 55.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: red_primary,
      ),
      child: Text(
        // '彭祖百忌：辛不合酱主人不尝 酉不宴客醉坐颠狂',
        '彭祖百忌：${_dateEntity!.pengZuBaiJi}',

        style: TextStyle(
          color: white_primary,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTaiShen() {
    return get_red_container(
      Row(
        children: [
          _taishen(),
          _chongsa(),
          _riwuxing(),
        ],
      ),
      width: 410.w,
      height: 65.h,
    );
  }

  Widget _taishen() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          get_title(
              label: "胎神占方",
              textColor: white_primary,
              backgroundColor: red_primary),
          Text(
            // "厨灶门外东南",
            _dateEntity!.tanShenZhanFang,
            style: TextStyle(
              fontSize: 16.sp,
              color: red_primary,
            ),
          ),
        ],
      ),
      width: 133.w,
      height: 62.h,
    );
  }

  Widget _chongsa() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          get_title(
              label: "冲煞",
              textColor: white_primary,
              backgroundColor: red_primary),
          Text(
            // "冲兔(乙卯)煞东",
            _dateEntity!.chongSha,
            style: TextStyle(
              fontSize: 16.sp,
              color: red_primary,
            ),
          ),
        ],
      ),
      width: 133.w,
      height: 62.h,
    );
  }

  Widget _riwuxing() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          get_title(
              label: "日五行",
              textColor: white_primary,
              backgroundColor: red_primary),
          Text(
            // "天上火",
            _dateEntity!.riWuXing,
            style: TextStyle(
              fontSize: 16.sp,
              color: red_primary,
            ),
          ),
        ],
      ),
      width: 141.w,
      height: 62.h,
    );
  }

  Widget _buildJiShen() {
    return get_red_container(
      Container(
        width: 410.w,
        child: Row(
          children: [
            Container(
              child: get_title(
                label: "吉神方位",
                textColor: white_primary,
                backgroundColor: red_primary,
                width: 85.w,
              ),
              width: 95.w,
              alignment: Alignment.center,
            ),
            _buildSubJiShen("喜神", _dateEntity!.xiShen),
            _buildSubJiShen("福神", _dateEntity!.fuShen),
            _buildSubJiShen("财神", _dateEntity!.caiShen),
            _buildSubJiShen("阳贵神", _dateEntity!.yangGuiShen, width: 65.w),
            _buildSubJiShen("阴贵神", "西南", width: 64.w),
          ],
        ),
      ),
      width: 410.w,
      height: 80.h,
    );
  }

  Widget _buildSubJiShen(String title, String content,
      {double? width, double? height}) {
    width ??= 61.w;
    height ??= 81.h;
    return //get_red_container(
        Container(
      width: width,
      height: height,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 5),
            height: height / 2,
            width: width,
            decoration: BoxDecoration(color: red_primary),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                color: white_primary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            content,
            style: TextStyle(
              fontSize: 16.sp,
              color: red_primary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
    // );
  }
}
