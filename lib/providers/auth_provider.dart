import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount _account;

  GoogleSignInAccount get account=>_account;

  Future googleLogin()async{
    final googleUser = await googleSignIn.signIn();
    if(googleUser == null)return;
    _account = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );
    print(_account.displayName);
    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();

  }
}
