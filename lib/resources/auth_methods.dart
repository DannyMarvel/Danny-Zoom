import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:danny_zoom/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
//To store in firestore, we initialize
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//Now we create a method for streamBuilder
  Stream<User?> get authChanges => _auth.authStateChanges();
//Now we get the current userName for all
  User get user => _auth.currentUser!;

//Now we create a function for siginig with google

  Future<bool> signInWithGoogle(BuildContext context) async {
    bool res = false;
    try {
//Now we create a google user and sign them In
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//Now we signIn the created user
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
//Now we get the credential of the user
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

//Now we create a UserCredential where our firebase auth package comes in
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
//Meaning if the user is new, the we add them to our database
        if (userCredential.additionalUserInfo!.isNewUser) {
          await _firestore.collection('users').doc(user.uid).set({
//This is how we add data to our firestore
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
          });
        }
        res = true;
      }
    }
//Now we catch only the firebase Exception Error
    on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      res = false;
    }
    return res;
  }
//Now we keep track of our data in firestore database
}
