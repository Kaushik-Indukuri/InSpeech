import 'package:cloud_firestore/cloud_firestore.dart';

/**
 * Class DatabaseMethods contains functions that fetches or gets 
 * data from the Firebase collections. Some collections include: users, 
 * speeches, notes. 
 *
 * @author Kaushik Indukuri, Yuvraj Khullar, Akhil Giridhar, Derek Xu
 * @version 1.0
 */

class DatabaseMethods {

  getUserByUsername(String username) async{
    return await FirebaseFirestore.instance.collection("users")
        .where("name", isEqualTo: username)
        .get();
  }

  getUserByEmail(String email) async{
    return await FirebaseFirestore.instance.collection("users")
        .where("email", isEqualTo: email)
        .get();
  }

  Future<void> uploadUserInfo(userData) async {
    FirebaseFirestore.instance.collection("users").add(userData).catchError((e) {
      print(e.toString());
    });
  }

  getSpeeches(String username) async{
    return await FirebaseFirestore.instance.collection("speeches")
        .where("user", isEqualTo: username)
        .get();
  }

  getInterestNotes(String name) async{
    return await FirebaseFirestore.instance.collection("notes")
        .where("name", isEqualTo: name)
        .get();
  }

}
