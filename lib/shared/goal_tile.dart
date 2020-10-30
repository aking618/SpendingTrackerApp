import 'package:flutter/material.dart';
import 'package:spending_tracker/models/goal.dart';
import 'package:spending_tracker/shared/constants.dart';

Widget GoalTile(Goal goal) {
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(right: 20.0, bottom: 150.0, top: 30.0),
    height: 150,
    width: 200,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        new BoxShadow(color: Colors.grey, blurRadius: 10.0),
      ],
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(goal.name),
        Text(
            'Goal: \$${goal.finalAmount.toStringAsFixed(2).replaceAllMapped(reg, mathFunc)}'),
        Text(
            'Current Amount: \$${goal.currentAmount.toStringAsFixed(2).replaceAllMapped(reg, mathFunc)}'),
        Text(
            'Remaining: \$${(goal.finalAmount - goal.currentAmount).toStringAsFixed(2).replaceAllMapped(reg, mathFunc)}')
      ],
    ),
  );
}
