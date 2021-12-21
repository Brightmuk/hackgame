import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackgame/models/appUser.dart';

class UserService {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final String userId = FirebaseAuth.instance.currentUser.uid;

  Future<void> newUser({
    String avatar,
    String username,
    String alias,
  }) async {
    try {
      await userCollection.doc(userId).set({
        'avatar': avatar,
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
    } catch (e) {
      print(e.toString());
    }
  }

  Future updateProfile({String toEdit, dynamic newValue}) async {
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
  return userCollection
        .doc(userId)
        .snapshots()
        .map((doc) => AppUser.fromMap(doc.data()));
}


}