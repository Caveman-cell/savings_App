import 'package:flutter/material.dart';
import '../core/models/saving_goal_model.dart';
import '../features/savings/pages/saving_detail_page.dart';

class SavingGoalCard extends StatelessWidget {
  final SavingGoalModel savingGoal;

  SavingGoalCard({required this.savingGoal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => SavingGoalDetailPage(goal: savingGoal), // Pass `savingGoal`
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              savingGoal.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              savingGoal.category,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: savingGoal.progress,
              color: Colors.pink,
              backgroundColor: Colors.grey.shade200,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$${savingGoal.currentAmount} / \$${savingGoal.goalAmount}"),
                Text(
                  "${(savingGoal.progress * 100).toInt()}%",
                  style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
