import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(id)
        .set(userInfoMap);
  }

  Future<Stream<QuerySnapshot>>getUserDetails()async{
    return await FirebaseFirestore.instance.collection("Users").snapshots();
  }

  Future<Stream<QuerySnapshot>>getDoctorDetails()async{
    return await FirebaseFirestore.instance.collection("Doctors").snapshots();
  }

  Future<Stream<QuerySnapshot>>getAmbulanceDetails()async{
    return await FirebaseFirestore.instance.collection("Ambulance").snapshots();
  }

  Future updateDoctor(Map<String, dynamic> doctorInfoMap, String id) async{
    return await FirebaseFirestore.instance.collection("Doctors").doc(id).update(doctorInfoMap);
  }

  Future<Stream<QuerySnapshot>>getCenterDetails()async{
    return await FirebaseFirestore.instance.collection("Centers").snapshots();
  }

  Future<Stream<QuerySnapshot>>getMedicineDetails()async{
    return await FirebaseFirestore.instance.collection("Medicine").snapshots();
  }
}
