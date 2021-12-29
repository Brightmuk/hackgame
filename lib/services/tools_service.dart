import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackgame/models/appUser.dart';
import 'package:hackgame/models/tools.dart';
import 'dart:developer';

import 'package:hackgame/providers/auth_provider.dart';
import 'package:hackgame/services/user_service.dart';

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

Future<void> buyTool({String currency, double amount, Tool tool})async{
   String userId = FirebaseAuth.instance.currentUser.uid;
   await FirebaseFirestore.instance.runTransaction((transaction) async {
     AppUser user = await UserService().appUserFuture;

     if(user!=null){
       await userCollection.doc(userId).update({
         currency:FieldValue.increment(-1*amount)
    });
    userCollection.doc(userId)
    .collection('tools')
    .add(tool.toMap());
     }
   }).catchError((e) {
     print(e.toString());
   });

}

}