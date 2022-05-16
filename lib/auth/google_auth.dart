import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../_pw_files/pw_constant.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_util.dart';

final _googleSignIn = GoogleSignIn();

Future<User> signInWithGoogle(BuildContext context) async {
  final signInFunc = () async {
    if (kIsWeb) {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithPopup(googleProvider);
    }

    try {
      await signOutWithGoogle().catchError((_) => null);
      final auth = await (await _googleSignIn.signIn())?.authentication;
      if (auth == null) {
        return null;
      }
      final credential = GoogleAuthProvider.credential(idToken: auth.idToken, accessToken: auth.accessToken);
      return FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print("Error while logging in with google");
      throw e;
    }
  };
  return signInOrCreateAccount(context, signInFunc);
}

Future signOutWithGoogle() => _googleSignIn.signOut();
