import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  Stream<FirebaseUser> user;
  Stream<Map<String, dynamic>> profile;

  PublishSubject loading = PublishSubject();
   
  AuthService() {
    user = _auth..

    profile = user.switchMap((FirebaseUser u) {
      if(u != null) {
        return _db.collection('users').document(u.uid).snapshots().map((snap) => snap.data)
      }
    });
  }

  Future<FirebaseUser> googleSignIn() async {

  }

  void updateUserData(FirebaseUser user) async {

  
  }

  void signOut() {

  }
}

final AuthService authService = AuthService();