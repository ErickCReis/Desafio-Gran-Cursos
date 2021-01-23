import 'dart:async';

import 'package:app/data/secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);

      final jwt = await _firebaseAuth.currentUser.getIdToken();
      await secureStorage.writeSecureData('jwt', jwt);

      return "Signed In";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signInWithFacebook() async {
    try {
      final AccessToken result = await FacebookAuth.instance.login();
      final FacebookAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.token);

      await _firebaseAuth.signInWithCredential(facebookAuthCredential);

      final jwt = await _firebaseAuth.currentUser.getIdToken();
      await secureStorage.writeSecureData('jwt', jwt);

      return "Signed In";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();

    final isSignedWithGoogle = await GoogleSignIn.standard().isSignedIn();
    if (isSignedWithGoogle) await GoogleSignIn.standard().disconnect();

    final isSignedWithFacebook = await FacebookAuth.instance.isLogged;
    if (isSignedWithFacebook != null) await FacebookAuth.instance.logOut();

    await secureStorage.deleteSecureData('jwt');
  }
}
