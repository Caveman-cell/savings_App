// widgets/progress_alert.dart

import 'package:flutter/material.dart';

class ProgressAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.pink.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: Colors.pink),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "Whoops! You only have 3 Months left! Try to increase your daily save.",
              style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
