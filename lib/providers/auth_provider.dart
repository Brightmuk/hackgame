import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:hackgame/models/appUser.dart';
import 'package:hackgame/services/user_service.dart';
import 'package:hackgame/widgets/error_dialogue.dart';
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



  Future googleLogin(BuildContext context)async{
    try{
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
    }catch(e){
      log(e.toString());
      showCupertinoDialog(context: context, builder: (ctx)=>ErrorDialogue(errorText: 'An error occurred, please try again',));
    }

  }


  Future facebookLogin(BuildContext context)async{
    final LoginResult result = await FacebookAuth.instance.login(); 

    if (result.status == LoginStatus.success) {
      final credential = FacebookAuthProvider.credential(result.accessToken.token);
      try{
        await FirebaseAuth.instance.signInWithCredential(credential);
      }catch(e){
        log(e.toString());
        showCupertinoDialog(context: context, builder: (ctx)=>ErrorDialogue(errorText: e.toString(),));
      }
      
    await UserService().appUserFuture; 

      notifyListeners();
    } else {
        log(result.status.toString());
        log(result.message);
        showCupertinoDialog(context: context, builder: (ctx)=>ErrorDialogue(errorText: result.message,));
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
