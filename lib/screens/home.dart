import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red[100],
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(40),
                  constraints: BoxConstraints.expand(height: 225),
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [Colors.red[200], Colors.red[400]],
                        begin: const FractionalOffset(1.0, 1.0),
                        end: const FractionalOffset(0.2, 0.2),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 50),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 45.0,
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          'John Doe',
                          style: TextStyle(fontSize: 50.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                //Next child of stack
                Container(
                  height: 300,
                  margin: EdgeInsets.only(top: 300),
                  padding: EdgeInsets.all(20.0),
                  child: ListView(
                    padding: EdgeInsets.only(left: 40.0),
                    scrollDirection: Axis.horizontal,
                    children: [
                      // getAccountInfoTiles()
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
