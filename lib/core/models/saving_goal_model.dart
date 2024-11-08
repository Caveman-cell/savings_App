class SavingGoalModel {
  final String title;
  final String category;
  final double currentAmount;
  final double goalAmount;

  SavingGoalModel({
    required this.title,
    required this.category,
    required this.currentAmount,
    required this.goalAmount,
  });

  double get progress => currentAmount / goalAmount;
  // Getter for total amount, equivalent to goalAmount in this case
  double get totalAmount => goalAmount;
}
