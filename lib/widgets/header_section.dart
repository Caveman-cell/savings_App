// widgets/header_section.dart

import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hi, Iquas", style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text("Good morning, hope you are doing well", style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
