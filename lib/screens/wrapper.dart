import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/models/MyUser.dart';
import 'package:spending_tracker/screens/authenticate/authenticate.dart';
import 'package:spending_tracker/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
