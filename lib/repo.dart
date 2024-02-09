import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthRepo {
static FirebaseAuth auth = FirebaseAuth.instance;
 Future<bool?> loginUsingEmailAndPassword(
      String email, String password) async {
    bool? res;
    debugPrint("Email :$email \n Password: $password");
    await auth.signInWithEmailAndPassword( email: email, password: password, ).then((value) {
        debugPrint("Response is ${value.user?.email}");
        res = true;
      }).onError((error, stackTrace) {
        res = false;
        debugPrint("Error is $error");
      });
      return res;
     
  }
 
}

