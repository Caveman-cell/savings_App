import 'package:flutter/material.dart';
import '../../../core/models/saving_goal_model.dart';

class SavingGoalDetailPage extends StatelessWidget {
  final SavingGoalModel goal;

  SavingGoalDetailPage({required this.goal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(goal.title),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Indicator Section
            Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: CircularProgressIndicator(
                          value: goal.currentAmount / goal.totalAmount,
                          strokeWidth: 8,
                          backgroundColor: Colors.grey.shade200,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                        ),
                      ),
                      Column(
                        children: [
                          Text("Collected", style: TextStyle(color: Colors.grey)),
                          Text(
                            "\$${goal.currentAmount.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${((goal.currentAmount / goal.totalAmount) * 100).toStringAsFixed(0)}%",
                            style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Auto Lock Section
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.lock, color: Colors.blue),
                            SizedBox(width: 10),
                            Text("Auto Lock", style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Switch(
                          value: true,
                          onChanged: (bool value) {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Saving Income Section
                  Text("Saving Income", style: TextStyle(fontWeight: FontWeight.bold)),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.pink.shade100,
                      child: Icon(Icons.wallet, color: Colors.pink),
                    ),
                    title: Text("Saving Pocket"),
                    subtitle: Text("From Iquas Arif"),
                    trailing: Text(
                      "- \$650.00",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  // Activity and Income Balance Section
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Activity and Income balance",
                                    style: TextStyle(color: Colors.white)),
                                SizedBox(height: 4),
                                Text("This Month", style: TextStyle(color: Colors.white)),
                                Text("89%", style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Last Month", style: TextStyle(color: Colors.white)),
                                Text("84%", style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text("View Insight"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
