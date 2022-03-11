import 'dart:io';

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
import 'package:lunar_clock/view/widgets/widgets.dart';

class LunarCalendar extends StatefulWidget {
  LunarCalendar({Key? key}) : super(key: key);

  @override
  _LunarCalendarState createState() => _LunarCalendarState();
}

class _LunarCalendarState extends State<LunarCalendar> {
  DateEntity? _dateEntity;
  TimeEntity? _timeEntity;

  DateTime _now = DateTime.now();
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

  @override
  Widget build(BuildContext context) {
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
              width: ScreenUtil().setWidth(Screen.width - 20),
              margin: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBigLunarDate(),
                  _buildWeek(),
                  // _buildFestival(),

                  _buildRow1(),
                  _getYi(),
                  _getJi(),
                  _buildTaiShen(),
                  _buildJiShen(),
                  _buildShiChen(),
                  _buildPengzu(),
                  // _buildRow5(),
                ],
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
      width: 120,
      height: 96,
      // margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(color: red_primary),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            // '辛丑年',
            _dateEntity!.ganZhi.split(" ")[0],
            style: TextStyle(
              fontSize: 20,
              color: white_primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            // '十二月小',
            _dateEntity!.nongLi.split(" ")[1],
            style: TextStyle(
              fontSize: 20,
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
      width: 410,
      alignment: Alignment.center,
      child: Text(
        // '15',
        _now.day.toString(),
        style: TextStyle(
          fontSize: 120,
          fontWeight: FontWeight.bold,
          color: red_primary,
        ),
      ),
    );
  }

  Widget _buildWeek() {
    return Container(
      width: ScreenUtil().setWidth(Screen.height - 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '腊八节',
            style: TextStyle(
              fontSize: 20,
              color: red_primary,
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            '星期六 第二周',
            style: TextStyle(
              fontSize: 24,
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
      width: 142,
      height: 96,
      decoration: BoxDecoration(color: red_primary),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            // '小寒 1月5日',
            _dateEntity!.jieQi.split(" ")[0],
            style: TextStyle(
              fontSize: 20,
              color: white_primary,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            // '大寒 1月20日',
            _dateEntity!.jieQi.split(" ")[1],
            style: TextStyle(
              fontSize: 20,
              color: white_primary,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            '三九第二天',
            style: TextStyle(
              fontSize: 20,
              color: white_primary,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.right,
          )
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
                margin: const EdgeInsets.only(top: 15),
                child: Image.asset(
                  // todo
                  // "assets/imgs/xingzuo/baiyang.png",
                  "assets/imgs/xingzuo/${xingzuo_to_res[_dateEntity!.xingZuo]}.png",
                  width: 60,
                  height: 60,
                ),
              ),
            ],
          ),
          width: 68,
          height: 96,
        ),
        _buildLunarDate(),
        _buildJeiqi(),
        get_red_container(
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                width: 70,
                child: get_title(
                  label: "日禄",
                  width: 60,
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
                    fontSize: 16,
                    color: red_primary,
                  ),
                ),
              ),
            ],
          ),
          width: 79,
          height: 96,
        ),
      ],
    );
  }

  Widget _buildRow2() {
    return Row(
      children: [
        _getYi(),
        _getJiXiongYiQu(),
        _getJi(),
      ],
    );
  }

  Widget _getJiXiongYiQu() {
    return get_red_container(
      Column(
        children: [
          Row(
            children: [
              _getJiShenYiqu(),
              _getXiongShenYiJi(),
            ],
          ),
          Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '冲煞',
                  style: TextStyle(
                    color: red_primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  '冲兔(乙卯)煞东',
                  style: TextStyle(
                    color: red_primary,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getJiShenYiqu() {
    return get_red_container(
      Column(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            child: Text(
              '吉神宜趋',
              style: TextStyle(
                color: green_primary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: Text(
              '解神 天马 除神 鸣犬',
              style: TextStyle(
                color: green_primary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      width: 101,
      height: 104,
    );
  }

  Widget _getXiongShenYiJi() {
    return get_red_container(
      Column(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            child: Text(
              '凶神宜忌',
              style: TextStyle(
                color: red_primary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: Text(
              '劫煞 小耗 五离 白虎',
              style: TextStyle(
                color: red_primary,
                fontSize: 16,
              ),
              maxLines: 4,
            ),
          ),
        ],
      ),
      width: 101,
      height: 104,
    );
  }

  Widget _getYi() {
    return get_red_container(
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
            margin: const EdgeInsets.all(8),
            child: Image.asset(
              "assets/imgs/yi.png",
            )),
        Container(
          width: 335,
          height: 60,
          margin: const EdgeInsets.all(5),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Text(
                // '装修 动土 订婚 安葬 上梁 修造 祈福 祭祀 拆卸 订盟',
                _dateEntity!.yi,
                softWrap: true,
                style: TextStyle(
                  color: green_primary,
                  fontSize: 18,
                ),
                maxLines: 2,
                textAlign: TextAlign.left),
          ),
        ),
      ]),
      width: 410,
      height: 75,
    );
  }

  Widget _getJi() {
    return get_red_container(
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.all(8),
          // child: labCirle(
          //   label: '忌',
          //   radius: 22,
          //   backgroundColor: red_primary,
          // ),
          child: Image.asset(
            "assets/imgs/ji.png",
          ),
        ),
        Container(
          width: 335,
          height: 60,
          margin: const EdgeInsets.all(5),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Text(_dateEntity!.ji,
                // '开业 开工 安床 开张 作灶 开市 立卷',
                softWrap: true,
                style: TextStyle(
                  color: red_primary,
                  fontSize: 18,
                ),
                maxLines: 2,
                textAlign: TextAlign.start),
          ),
        ),
      ]),
      width: 410,
      height: 75,
    );
  }

  Widget _buildRow3() {
    return Row(children: [_getTaiShen(), _getWuxing()]);
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

  Widget _getTaiShen() {
    return get_red_container(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 38,
            height: 49,
            child: Text(
              '胎神占方',
              style: TextStyle(
                color: green_primary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
              maxLines: 2,
            ),
          ),
          Text(
            '厨灶门外东南',
            style: TextStyle(
              color: green_primary,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      width: 160,
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
            fontSize: 18,
          ),
        ),
        Text(
          // e,
          item.shiGanZhi.split("")[1],
          style: TextStyle(
            color: red_primary,
            fontSize: 18,
          ),
        ),
        Text(
          // "吉",
          item.jiXiong.split(" ")[0],
          style: TextStyle(
            color: green_primary,
            fontSize: 18,
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
                  width: 85,
                ),
                width: 120,
                alignment: Alignment.center,
              ),
              Container(
                width: 280,
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
                    ]
                    // lunar_dizhi_char.map((e) {
                    //   return Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       Text(
                    //         // "甲",
                    //         _timeEntity!.zi.shiGanZhi.split("")[0],
                    //         style: TextStyle(
                    //           color: red_primary,
                    //           fontSize: 18,
                    //         ),
                    //       ),
                    //       Text(
                    //         // e,
                    //         _timeEntity!.zi.shiGanZhi.split("")[1],
                    //         style: TextStyle(
                    //           color: red_primary,
                    //           fontSize: 18,
                    //         ),
                    //       ),
                    //       Text(
                    //         // "吉",
                    //         _timeEntity!.zi.jiXiong.split(" ")[0],
                    //         style: TextStyle(
                    //           color: green_primary,
                    //           fontSize: 18,
                    //         ),
                    //       ),
                    //     ],
                    //   );
                    // }).toList(),
                    ),
              ),
            ],
          ),
        ),
        width: 410,
        height: 102);
  }

  Widget _buildPengzu() {
    return Container(
      width: 410,
      height: 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: red_primary,
      ),
      child: Text(
        // '彭祖百忌：辛不合酱主人不尝 酉不宴客醉坐颠狂',
        '彭祖百忌：${_dateEntity!.pengZuBaiJi}',

        style: TextStyle(
          color: white_primary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildRow5() {
    return get_red_container(Row(
      children: [
        _buil_row5_cell('耕田', '十一牛耕田'),
        _buil_row5_cell('治水', '二龙治水'),
        _buil_row5_cell('得金', '一日得金'),
        _buil_row5_cell('分饼', '六人分饼'),
      ],
    ));
  }

  Widget _buil_row5_cell(String title, String content) {
    return get_red_container(
      Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            content,
            style: TextStyle(
              fontSize: 16,
            ),
          )
        ],
      ),
      width: 103,
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
        width: 410,
        height: 62);
  }

  Widget _taishen() {
    return get_red_container(
      Column(
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
              fontSize: 16,
              color: red_primary,
            ),
          ),
        ],
      ),
      width: 134,
      height: 62,
    );
  }

  Widget _chongsa() {
    return get_red_container(
        Column(
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
                fontSize: 16,
                color: red_primary,
              ),
            ),
          ],
        ),
        width: 134,
        height: 62);
  }

  Widget _riwuxing() {
    return get_red_container(
      Column(
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
              fontSize: 16,
              color: red_primary,
            ),
          ),
        ],
      ),
      width: 140,
    );
  }

  Widget _buildJiShen() {
    return get_red_container(
      Container(
        width: 410,
        child: Row(
          children: [
            Container(
              child: get_title(
                label: "吉神方位",
                textColor: white_primary,
                backgroundColor: red_primary,
                width: 85,
              ),
              width: 90,
              alignment: Alignment.center,
            ),
            _buildSubJiShen("喜神", _dateEntity!.xiShen),
            _buildSubJiShen("福神", _dateEntity!.fuShen),
            _buildSubJiShen("财神", _dateEntity!.caiShen),
            _buildSubJiShen("阳贵神", _dateEntity!.yangGuiShen),
            _buildSubJiShen("阴贵神", "西南", width: 64),
          ],
        ),
      ),
      width: 410,
      height: 75,
    );
  }

  Widget _buildSubJiShen(String title, String content,
      {double? width, double? height}) {
    width ??= 61;
    height ??= 81;
    return get_red_container(
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
                  fontSize: 18,
                  color: white_primary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              content,
              style: TextStyle(
                fontSize: 16,
                color: red_primary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
