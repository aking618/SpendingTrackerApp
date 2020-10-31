import 'package:flutter/material.dart';
import 'package:spending_tracker/models/account.dart';
import 'package:spending_tracker/shared/constants.dart';

Widget AddTile(double bottomOffset) {
  return InkWell(
    onTap: () {
      print('AddTile tapped');
    },
    child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(right: 20.0, bottom: bottomOffset, top: 30.0),
        height: 150,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            new BoxShadow(color: Colors.grey, blurRadius: 10.0),
          ],
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            size: 50.0,
          ),
        )),
  );
}
