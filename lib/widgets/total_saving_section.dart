import 'package:flutter/material.dart';
import '../features/savings/pages/all_saving_goals_page.dart';
import '../core/models/saving_goal_model.dart';

class TotalSavingSection extends StatelessWidget {
  final double totalSaving;
  final List<SavingGoalModel> savingGoals;
  final Function(double) onAddMoney; // Tambahkan callback

  TotalSavingSection({
    required this.totalSaving,
    required this.savingGoals,
    required this.onAddMoney,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Saving Goals",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllSavingGoalsPage(savingGoals: savingGoals),
                    ),
                  );
                },
                child: const Text("See All"),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total Saving", style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 5),
                  Text(
                    "\$${totalSaving.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  // Tampilkan dialog input jumlah uang
                  double? amount = await _showAddMoneyDialog(context);
                  if (amount != null) {
                    onAddMoney(amount); // Panggil callback untuk menambahkan uang
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text("Add Money"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<double?> _showAddMoneyDialog(BuildContext context) async {
    double? amount;
    return showDialog<double>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Money"),
          content: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter amount"),
            onChanged: (value) {
              amount = double.tryParse(value);
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(amount);
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }
}
