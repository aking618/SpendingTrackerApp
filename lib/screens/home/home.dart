import 'package:flutter/material.dart';
import 'package:spending_tracker/models/account.dart';
import 'package:spending_tracker/shared/account_info_tiles.dart';
import 'package:spending_tracker/screens/home/home_tabs.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool home = true;
  bool goals = false;
  bool graphs = false;
  Widget tab;

  @override
  Widget build(BuildContext context) {
    getTab();
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(40),
                  constraints: BoxConstraints.expand(height: 175),
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [Colors.blue[200], Colors.blue[400]],
                        begin: const FractionalOffset(1.0, 1.0),
                        end: const FractionalOffset(0.2, 0.2),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 25),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25.0,
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          'John Doe',
                          style: TextStyle(fontSize: 45.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(30.0),
                  margin: EdgeInsets.only(top: 150.0, right: 20.0, left: 20.0),
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    boxShadow: [
                      new BoxShadow(color: Colors.grey, blurRadius: 10.0),
                    ],
                  ),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'My Balance:',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Text(
                              '\$xx,xxx.xx',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        ),
                        Divider(color: Colors.black),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.payment),
                                label: Text('Pay')),
                            FlatButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.compare_arrows),
                                label: Text('Transfer')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  margin: EdgeInsets.only(top: 400),
                  padding: EdgeInsets.all(20.0),
                  child: ListView(
                    padding: EdgeInsets.only(left: 40.0),
                    scrollDirection: Axis.horizontal,
                    children: getAccountTiles(accountsList),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 20.0, bottom: 20.0, right: 20.0, top: 60.0),
                  margin: EdgeInsets.only(top: 219),
                  constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height - 219),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      tab,
                      Container(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                height: 80,
                                width: 80,
                                child: FloatingActionButton(
                                  child: Icon(Icons.home),
                                  onPressed: () {
                                    setState(() {
                                      home = true;
                                      goals = false;
                                      graphs = false;
                                      getTab();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                height: 80,
                                width: 80,
                                child: FloatingActionButton(
                                  child: Icon(Icons.compare),
                                  onPressed: () {
                                    setState(() {
                                      home = false;
                                      goals = true;
                                      graphs = false;
                                      getTab();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                height: 80,
                                width: 80,
                                child: FloatingActionButton(
                                  child: Icon(Icons.multiline_chart),
                                  onPressed: () {
                                    setState(() {
                                      home = false;
                                      goals = false;
                                      graphs = true;
                                      getTab();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void getTab() {
    if (home) {
      tab = homeTab();
    }
    if (goals) {
      tab = goalsTab();
    }
    if (graphs) {
      tab = graphsTab();
    }
  }

  List<Widget> getAccountTiles(List<Account> accountList) {
    List<Widget> accountTiles = [];
    for (Account account in accountList) {
      accountTiles.add(AccountInfoTile(account));
    }
    return accountTiles;
  }
}

/*
  ToDo: 
    - Bottom Nav Bar Either Navigation Bar or FloatingActionButton
    - State Manage Bottom Nav Bar
    - Implement Firestore Stuff
    - Pay / Transfer functionality
    - Adding Accounts
    - Graphs and Goals
    - Setting a specific goal to a specfic account
*/
