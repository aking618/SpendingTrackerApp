import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spending_tracker/models/MyUser.dart';
import 'package:spending_tracker/models/account.dart';
import 'package:spending_tracker/models/goal.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection references
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference accountCollection =
      FirebaseFirestore.instance.collection('accounts');

  final CollectionReference goalCollection =
      FirebaseFirestore.instance.collection('goals');

  // update collections
  Future updateUserData(String name) async {
    return await userCollection.doc(uid).set({'name': name});
  }

  Future updateAccountData(String accountName, String accountType,
      double currentAmount, String image) async {
    return await accountCollection.doc(uid).set({
      'accountName': accountName,
      'accountType': accountType,
      'currentAmount': currentAmount,
      'image': image
    });
  }

  Future updateGoalData(
      String goalName, double finalAmount, double currentAmount) async {
    return await goalCollection.doc(uid).set({
      'goalName': goalName,
      'finalAmount': finalAmount,
      'currentAmount': currentAmount
    });
  }
}
