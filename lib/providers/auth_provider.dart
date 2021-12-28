import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:hackgame/models/appUser.dart';
import 'package:hackgame/services/user_service.dart';
import 'dart:developer';
import 'package:play_games/play_games.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AuthProvider extends ChangeNotifier{


AuthProvider(){
  init();
}

final googleSignIn = GoogleSignIn();

  AppUser _user;
  AppUser get user=>_user;



  Future googleLogin()async{
    GoogleSignInAccount _account;
    final googleUser = await googleSignIn.signIn();
    if(googleUser == null)return;
    _account = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    _user = await UserService().appUserFuture; 
    notifyListeners();

  }


  Future facebookLogin()async{
    final LoginResult result = await FacebookAuth.instance.login(); 

    if (result.status == LoginStatus.success) {
      final credential = FacebookAuthProvider.credential(result.accessToken.token);

      await FirebaseAuth.instance.signInWithCredential(credential);
      
    await UserService().appUserFuture; 

      notifyListeners();
    } else {
        log(result.status.toString());
        log(result.message);
    }
  }

// Future googlePlayLogin()async{
//       SigninResult result = await PlayGames.signIn();
//     if (result.success) {
//         await PlayGames.setPopupOptions();
//         this.account = result.account;
//     } else {
//         this.error = result.message;
//     }
//     this.loading = false;
// }



 

  void signOut(){
  FirebaseAuth.instance.signOut();
  notifyListeners();
  }
   StreamController _userStreamC;


  void init()async{
   UserService().appUser.listen((user) {
     _user=user;
     notifyListeners();
   });
  }

}
