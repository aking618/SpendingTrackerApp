import 'package:firebase_auth/firebase_auth.dart';
import 'package:spending_tracker/models/MyUser.dart';
import 'package:spending_tracker/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create MyUser object based on User
  MyUser _myUserFromFirebaseUser(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // auth change MyUser stream
  Stream<MyUser> get myUser {
    return _auth.authStateChanges().map(_myUserFromFirebaseUser);
  }

  // sign in Anonomously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _myUserFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData('New User');
      await DatabaseService(uid: user.uid).updateAccountData(
          'TestCheck', 'Checking', 1234.56, 'assets/checking.png');
      await DatabaseService(uid: user.uid)
          .updateGoalData('Test Goal', 1500.00, 123.65);
      return _myUserFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
