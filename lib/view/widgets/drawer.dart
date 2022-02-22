import 'package:flutter/material.dart';

Widget my_drawer() {
  return ListView(
    padding: const EdgeInsets.all(5),
    children: [
      const DrawerHeader(
        child: CircleAvatar(
          radius: 36.0,
          backgroundImage: AssetImage('assets/imgs/avatar.jpeg'),
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
      ListTile(),
    ],
  );
}
