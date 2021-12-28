import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackgame/models/appUser.dart';
import 'dart:developer';

import 'package:hackgame/providers/auth_provider.dart';

class UserService {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');


  Future<void> newUser({
    String avatar,
    String username,
    String alias,
    String ip,
    AuthProvider provider,
  }) async {
    String userId = FirebaseAuth.instance.currentUser.uid;
    try {
      await userCollection.doc(userId).set({
        'avatar': avatar,
        'ip':ip,
        'username': username,
        'joinedDate': DateTime.now(),
        'alias': alias,
        'level': 1,
        'reputation': 100,
        'attacks':0,
        'contracts':0,
        'hacks':0,
        'money':1000,
        'crypto':1000
      }, SetOptions(merge: true));
     AuthProvider().init();
    } catch (e) {
      print(e.toString());
    }
  }

  Future updateProfile({String toEdit, dynamic newValue}) async {
  String userId = FirebaseAuth.instance.currentUser.uid;
  try {
    return await userCollection.doc(userId).update({
      toEdit: newValue
    });
  } catch (e) {
    print(e.toString());
    return null;
  }
}
Stream<AppUser> get appUser{
  String userId = FirebaseAuth.instance.currentUser?.uid;
  return userCollection
        .doc(userId)
        .snapshots()
        .map((doc) => AppUser.fromMap(doc.data()));
}

Future<AppUser> get appUserFuture{
  
  String userId = FirebaseAuth.instance.currentUser?.uid;
  return userCollection
        .doc(userId)
        .get()
        .then((doc){
          if(doc.exists){
            return AppUser.fromMap(doc.data());
          }else{
            return null;
          }
       } 
    );
}

}