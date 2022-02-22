import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lunar_clock/view/dial_plate.dart';

class AlarmView extends StatefulWidget {
  AlarmView({Key? key}) : super(key: key);

  @override
  _AlarmViewtate createState() => _AlarmViewtate();
}

class _AlarmViewtate extends State<AlarmView> {
  late Timer _timer;
  final double radius = 100;
  bool _firstSwitch = true;
  bool _secondSwitch = false;
  bool _thirdSwitch = false;
  final Color _colorOn = Colors.white;
  final Color _colorOff = Colors.grey;
  final Color _switchActiveColor = Colors.blue;
  final Color _switchInactiveColor = Colors.blueGrey;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  Widget _getAlarms() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        height: 200,
        width: double.infinity,
        child: Column(
          children: [
            _getRow1(),
            _getRow2(),
            _getRow3(),
          ],
        ),
      ),
    );
  }

  Widget _getRow1() {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          Text(
            "06:45",
            style: TextStyle(
              fontSize: 25,
              color: _firstSwitch ? _colorOn : _colorOff,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Text(
              'wake up!',
              style: TextStyle(
                fontSize: 18,
                color: _firstSwitch ? _colorOn : _colorOff,
              ),
            ),
          ),
          Expanded(child: SizedBox()),
          Container(
            width: 90,
            height: 10,
            child: Switch(
              value: _firstSwitch,
              onChanged: (value) {
                setState(() {
                  _firstSwitch = value;
                });
              },
              activeColor: _switchActiveColor,
              activeTrackColor: Colors.black.withAlpha(100),
              inactiveThumbColor: _switchInactiveColor,
              inactiveTrackColor: Colors.black.withAlpha(20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getRow2() {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          Text(
            "06:45",
            style: TextStyle(
              fontSize: 25,
              color: _secondSwitch ? _colorOn : _colorOff,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Text(
              'wake up!',
              style: TextStyle(
                fontSize: 18,
                color: _secondSwitch ? _colorOn : _colorOff,
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          Container(
            width: 90,
            height: 10,
            child: Switch(
              value: _secondSwitch,
              onChanged: (value) {
                setState(() {
                  _secondSwitch = value;
                });
              },
              activeColor: _switchActiveColor,
              activeTrackColor: Colors.black.withAlpha(100),
              inactiveThumbColor: _switchInactiveColor,
              inactiveTrackColor: Colors.black.withAlpha(20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getRow3() {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          Text(
            "06:45",
            style: TextStyle(
              fontSize: 25,
              color: _thirdSwitch ? _colorOn : _colorOff,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Text(
              'wake up!',
              style: TextStyle(
                fontSize: 18,
                color: _thirdSwitch ? _colorOn : _colorOff,
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          Container(
            width: 90,
            height: 10,
            child: Switch(
              value: _thirdSwitch,
              onChanged: (value) {
                setState(() {
                  _thirdSwitch = value;
                });
              },
              activeColor: _switchActiveColor,
              activeTrackColor: Colors.black.withAlpha(100),
              inactiveThumbColor: _switchInactiveColor,
              inactiveTrackColor: Colors.black.withAlpha(20),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            painter: DialPlate(
              context,
              const Color.fromARGB(255, 70, 0, 144),
              const Color.fromARGB(255, 121, 83, 254),
            ),
          ),
          _getAlarms(),
        ],
      ),
    );
  }
}
