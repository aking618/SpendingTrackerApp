import 'package:flutter/material.dart';

class Account {
  String name;
  String accountType;
  double currentAmount;
  AssetImage image;

  Account({this.name, this.accountType, this.currentAmount, this.image});
}

List<Account> accountsList = [
  testChecking,
  testSavings,
  testChecking,
  testSavings,
  testChecking,
  testSavings,
  testChecking,
  testSavings,
];

Account testChecking = Account(
    name: "Arvest Check",
    accountType: "Checking",
    currentAmount: 486.26,
    image: new AssetImage("assets/checking.png"));

Account testSavings = Account(
    name: "Arvest Savings",
    accountType: "Savings",
    currentAmount: 10549.32,
    image: new AssetImage("assets/savings.png"));
