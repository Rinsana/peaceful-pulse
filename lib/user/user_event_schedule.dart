import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peaceful_pulse/models/doctor_model.dart';
import 'package:peaceful_pulse/services/database_methods.dart';
import 'package:peaceful_pulse/user/user_doctor_booking.dart';

import '../constants/custom_colors.dart';

class UserEventSchedule extends StatefulWidget {
  const UserEventSchedule({super.key});

  @override
  State<UserEventSchedule> createState() => _UserEventScheduleState();
}

class _UserEventScheduleState extends State<UserEventSchedule> {
  Stream? campStream;
  Stream? centerDet1;
  Map<String, dynamic>? centerDet;
  Map<String, dynamic>? doctorDet;

  getOnTheLoad() async {
    campStream = await DataBaseMethods().getCampDetails();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  Future<Map<String, dynamic>?> callingDoc(String center) async {
    setState(() {
      centerDet = FirebaseFirestore.instance
          .collection("Center")
          .where(center)
          .parameters;
    });
    String docName = centerDet!["Doctor"];
    final snapshotDoc = await FirebaseFirestore.instance
        .collection('Doctors')
        .where('id', isEqualTo: docName)
        .get();
    doctorDet = snapshotDoc.docs.first.data();
    return doctorDet;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: const Text(
                "Medical Camp Events",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            const Divider(
              color: Colors.black45,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: StreamBuilder(
                        stream: campStream,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          return snapshot.hasData
                              ? ListView.separated(
                                  itemCount: snapshot.data.docs.length,
                                  itemBuilder: (context, index) {
                                    DocumentSnapshot ds =
                                        snapshot.data.docs[index];
                                    return InkWell(
                                      onTap: () async {
                                        // Map<String, dynamic> physi= callingDoc(ds["Center Name"]);
                                        Map<String, dynamic> physi = {
                                          "Designation": "Pediatritian",
                                          "Email": "reshmi@gmail.com",
                                          "Image":
                                              "https://firebasestorage.googleapis.com/v0/b/peaceful-pulse-c17ab.appspot.com/o/doctor%2F1717397211699.jpg?alt=media&token=c1593fb0-d103-4506-a538-388ca1747e30",
                                          "Name": "Reshmi",
                                          "Password": "123456",
                                          "id": "gM6gOxX2lGbWRzrn5RpdQCpqDN12"
                                        };
                                        DoctorModel docModel = DoctorModel(
                                            name: physi["Name"],
                                            eMail: physi["Email"],
                                            designation: physi["Designation"],
                                            // phoneNumber:
                                            //     ds["Phone"],
                                            password: physi["Password"],
                                            image: physi["Image"],
                                            id: physi["id"]);
                                        print(docModel);
                                        await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UserDoctorBooking(
                                                        docmodel: docModel)));
                                      },
                                      child: Card(
                                        elevation: 5,
                                        child: ListTile(
                                          tileColor: const Color.fromARGB(
                                              255, 218, 186, 132),
                                          title: Text(
                                            "Medical Camp at ${ds["Location"]}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          subtitle: Text(ds["Date"]),
                                          trailing: Text(
                                            "Book Now",
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 102, 154, 43),
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      height: 25,
                                    );
                                  },
                                )
                              : Container();
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
