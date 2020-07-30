import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
 
class CrudMedthods {

  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

 
  getData(int aadharNumber) async {
    return await Firestore.instance.collection('users').document("$aadharNumber").collection("lands").getDocuments();
  }

}