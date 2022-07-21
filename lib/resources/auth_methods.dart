import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:picstagram/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // REGISTERING USER :

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "some error occured";
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty &&
          file != null) {
        // register user :
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        // add user to our database :
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'photoUrl': photoUrl,
          'followers': [],
          'following': [],
        });

        res = "success";
      } else {
        res = "Please enter all the fields properly";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        res = "The email is badly formatted";
      } else if (e.code == 'weak-password') {
        res = "Password should be at least 6 characters";
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  // LOGGING IN USER :
  Future<String> logInUser({
    required String email,
    required String password,
  }) async {
    String res = "Some Error Occured";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter all the fields properly";
      }
    } on FirebaseAuthException catch (e) {
      res = e.toString();
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}