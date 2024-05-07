import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods{
  Future addPhotoDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(id)
        .set(userInfoMap);
  }
}