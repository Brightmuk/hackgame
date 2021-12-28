import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackgame/models/appUser.dart';
import 'package:hackgame/models/tools.dart';
import 'dart:developer';

import 'package:hackgame/providers/auth_provider.dart';

class ToolsService {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference toolsCollection = 
      FirebaseFirestore.instance.collection('tools');


Stream<List<Tool>> get getAllTools{

  return toolsCollection
        .snapshots()
        .map((query) {
            return query.docs.map((doc) => Tool.fromMap(doc.data())).toList();
        });
}

Stream<List<Tool>> get getUserTools{
 String userId = FirebaseAuth.instance.currentUser.uid;
  return userCollection
        .doc(userId)
        .collection('tools')
        .snapshots()
        .map((query) {
            return query.docs.map((doc) => Tool.fromMap(doc.data())).toList();
        });
}

}