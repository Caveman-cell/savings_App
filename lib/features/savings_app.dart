import 'package:flutter/material.dart';
import '../../core/models/saving_goal_model.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/header_section.dart';
import '../../widgets/total_saving_section.dart';
import '../../widgets/progress_alert.dart';
import '../../widgets/saving_goal_card.dart';
import 'savings/pages/all_saving_goals_page.dart';

class SavingsApp extends StatefulWidget {
  @override
  _SavingsAppState createState() => _SavingsAppState();
}

class _SavingsAppState extends State<SavingsApp> {
  double totalSaving = 1120.00;

  // Data contoh untuk saving goals
  final List<SavingGoalModel> savingGoals = [
    SavingGoalModel(title: "Trip to Cijengkol", category: "Main Saving", currentAmount: 3650.00, goalAmount: 5000.00),
    SavingGoalModel(title: "Beli Laptop Baru", category: "Gadget", currentAmount: 800.00, goalAmount: 1500.00),
    SavingGoalModel(title: "Liburan ke Bali", category: "Liburan", currentAmount: 1200.00, goalAmount: 3000.00),
  ];

  // Fungsi untuk menambah uang ke total tabungan
  void _addMoney(double amount) {
    setState(() {
      totalSaving += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: customAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderSection(),
              SizedBox(height: 20),
              TotalSavingSection(
                totalSaving: totalSaving,
                savingGoals: savingGoals,
                onAddMoney: _addMoney, // Menambahkan parameter onAddMoney
              ),
              SizedBox(height: 30),
              ProgressAlert(),
              SizedBox(height: 20),
              _buildSavingGoalsSection(context, savingGoals),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSavingGoalsSection(BuildContext context, List<SavingGoalModel> savingGoals) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Saving Goals", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () {
                // Navigasi ke halaman "AllSavingGoalsPage"
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllSavingGoalsPage(savingGoals: savingGoals),
                  ),
                );
              },
              child: Text("See All"),
            ),
          ],
        ),
        SizedBox(height: 10),
        // Tampilkan hanya satu kartu sebagai contoh di halaman utama
        SavingGoalCard(savingGoal: savingGoals[0]),
      ],
    );
  }
}
