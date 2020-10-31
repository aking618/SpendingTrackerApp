import 'package:flutter/material.dart';
import 'package:spending_tracker/models/account.dart';
import 'package:spending_tracker/shared/account_info_tiles.dart';
import 'package:spending_tracker/models/goal.dart';
import 'package:spending_tracker/shared/add_tile.dart';
import 'package:spending_tracker/shared/goal_tile.dart';

Widget homeTab() {
  return Container(
    height: 300,
    margin: EdgeInsets.only(top: 400),
    padding: EdgeInsets.all(20.0),
    child: ListView(
      padding: EdgeInsets.only(left: 40.0),
      scrollDirection: Axis.horizontal,
      children: getAccountTiles(accountsList),
    ),
  );
}

Widget goalsTab() {
  return Container(
    height: 450,
    margin: EdgeInsets.only(top: 400),
    padding: EdgeInsets.all(20.0),
    child: ListView(
      padding: EdgeInsets.only(left: 40.0),
      scrollDirection: Axis.horizontal,
      children: getGoalTiles(goalList),
    ),
  );
}

Widget graphsTab() {
  return AddTile(30.0);
}

List<Widget> getAccountTiles(List<Account> accountList) {
  List<Widget> accountTiles = [];
  for (Account account in accountList) {
    accountTiles.add(AccountInfoTile(account));
  }
  accountTiles.add(AddTile(30.0));
  return accountTiles;
}

List<Widget> getGoalTiles(List<Goal> goalList) {
  List<Widget> goalTiles = [];
  for (Goal goal in goalList) {
    goalTiles.add(GoalTile(goal));
  }
  goalTiles.add(AddTile(150.0));
  return goalTiles;
}
