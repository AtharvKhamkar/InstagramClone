import 'dart:ffi';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//signup user
  Future<String> SignUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    // required Uint8List file,
  }) async {
    String res = 'Some error occurred';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);
        //add user to data base
        await _firestore.collection('user').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
        });
        res = 'Success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
