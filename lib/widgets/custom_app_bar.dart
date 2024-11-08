// widgets/custom_app_bar.dart

import 'package:flutter/material.dart';

AppBar customAppBar() {
  return AppBar(
    backgroundColor: Colors.purple[300],
    elevation: 0,
    leading: Icon(Icons.menu, color: Colors.white),
    title: Row(
      children: [
        Icon(Icons.pets, color: Colors.white),
        SizedBox(width: 10),
        Text('Savings App'),
      ],
    ),
    actions: [
      IconButton(
        icon: Icon(Icons.notifications, color: Colors.white),
        onPressed: () {},
      ),
    ],
  );
}
