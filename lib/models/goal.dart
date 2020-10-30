import 'package:spending_tracker/models/account.dart';

class Goal {
  final String name;
  final double finalAmount;
  final double currentAmount;

  Goal({this.name, this.currentAmount, this.finalAmount});
}

List<Goal> goalList = [oneGoal, twoGoal, oneGoal, twoGoal];

Goal oneGoal = Goal(
    name: 'Savings Goal',
    finalAmount: 500.00,
    currentAmount: accountsList[0].currentAmount);

Goal twoGoal = Goal(
    name: 'Checking Goal',
    finalAmount: 15000.00,
    currentAmount: accountsList[1].currentAmount);
