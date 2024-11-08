// lib/features/savings/pages/all_saving_goals_page.dart

import 'package:flutter/material.dart';
import '../../../core/models/saving_goal_model.dart';
import '../../../widgets/saving_goal_card.dart';

class AllSavingGoalsPage extends StatelessWidget {
  final List<SavingGoalModel> savingGoals;

  AllSavingGoalsPage({required this.savingGoals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Saving Goals"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: savingGoals.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SavingGoalCard(savingGoal: savingGoals[index]),
          );
        },
      ),
    );
  }
}
