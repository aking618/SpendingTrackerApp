import 'package:flutter/material.dart';
import 'package:spending_tracker/models/account.dart';

Widget AccountInfoTile(Account account) {
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(right: 20.0, bottom: 30.0, top: 30.0),
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: account.image,
            ),
            Text(
              account.name,
              //style: TextStyle(),
            ),
          ],
        ),
        Text(account.accountType),
        Text(account.currentAmount.toString()),
      ],
    ),
  );
}
