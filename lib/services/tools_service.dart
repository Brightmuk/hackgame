import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackgame/models/appUser.dart';
import 'package:hackgame/models/tools.dart';
import 'dart:developer';

import 'package:hackgame/providers/auth_provider.dart';
import 'package:hackgame/services/user_service.dart';

class ToolsService {

  final String toolId;


  ToolsService({this.toolId});

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


Future<Tool> getTool(String id)async{
   String userId = FirebaseAuth.instance.currentUser.uid;
  final ref = await userCollection
        .doc(userId)
        .collection('tools')
        .doc(id)
        .get();
      if(ref.exists){
        return Tool.fromMap(ref.data());
      }else{
        return null;
      }
      
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
    .doc(tool.id)
    .set(tool.toMap());
     }
   }).catchError((e) {
     print(e.toString());
   });

}

Future<void> enableDisableTool(bool val)async{
   String userId = FirebaseAuth.instance.currentUser.uid;
   try{
      userCollection.doc(userId)
      .collection('tools')
      .doc(toolId)
      .update({
        'meta.enabled':val
      },);

   }catch(e){
     print(e.toString());
  
   }

}

Future<void> upgradeTool({String currency, double amount, String toolId})async{
   String userId = FirebaseAuth.instance.currentUser.uid;
   await FirebaseFirestore.instance.runTransaction((transaction) async {
     AppUser user = await UserService().appUserFuture;

     if(user!=null){
       await userCollection.doc(userId).update({
         currency:FieldValue.increment(-1*amount)
    });
    userCollection.doc(userId)
    .collection('tools')
    .doc(toolId)
    .update({
      'level':FieldValue.increment(1)
    },);
     }
   }).catchError((e) {
     print(e.toString());
   });
}

}