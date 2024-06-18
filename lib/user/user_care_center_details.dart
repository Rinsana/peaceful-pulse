import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:peaceful_pulse/constants/custom_colors.dart';
import 'package:peaceful_pulse/models/doctor_model.dart';
import 'package:peaceful_pulse/services/database_methods.dart';
import 'package:peaceful_pulse/user/user_doctor_booking.dart';
import 'package:peaceful_pulse/user/user_volunteer_booking.dart';

class UseCareCenterDetails extends StatefulWidget {
  const UseCareCenterDetails({super.key, required this.ds});

  final DocumentSnapshot? ds;

  @override
  State<UseCareCenterDetails> createState() => _UseCareCenterDetailsState();
}

class _UseCareCenterDetailsState extends State<UseCareCenterDetails> {
  Map<String, dynamic> doctorDet = {};
  Map<String, dynamic> volunteerDet = {};
  Map<String, dynamic> ambulanceDet = {};
  Future callDoctor(String doctor) async {
    final snapshotDoc = await FirebaseFirestore.instance
        .collection('Doctors')
        .where('id', isEqualTo: doctor)
        .get();
    doctorDet = snapshotDoc.docs.first.data();
  }

  Future callVolunteer(String volunteer) async {
    final snapshotDoc = await FirebaseFirestore.instance
        .collection('Volunteer')
        .where('id', isEqualTo: volunteer)
        .get();
    volunteerDet = snapshotDoc.docs.first.data();
  }

  Future callAmbulance(String ambulance) async {
    final snapshotDoc = await FirebaseFirestore.instance
        .collection('Ambulance')
        .where('id', isEqualTo: ambulance)
        .get();
    ambulanceDet = snapshotDoc.docs.first.data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.secondaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
              color: Colors.black,
            )),
      ),
      body: Container(
        color: CustomColors.secondaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: 200,
                    child: SizedBox(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: widget.ds!.exists
                          ? Image.network(widget.ds?["Image"])
                          : Center(
                              child: Text("Photo"),
                            ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.ds!["Name"],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: CustomColors.primaryColor),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 20,
                      child: Text(widget.ds!["Email"]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 5),
                        child: FutureBuilder(
                            future: callDoctor(widget.ds!["Doctor"]),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        width: 80,
                                        height: 80,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      doctorDet["Image"]))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        doctorDet["Name"],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Book with timing",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          DoctorModel docModel = DoctorModel(
                                              name: doctorDet["Name"],
                                              eMail: doctorDet["Email"],
                                              designation:
                                                  doctorDet["Designation"],
                                              // phoneNumber: doctorDet["Phone"],
                                              password: doctorDet["Password"],
                                              image: doctorDet["Image"],
                                              id: doctorDet["id"]);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UserDoctorBooking(
                                                          docmodel: docModel)));
                                        },
                                        style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            foregroundColor: Colors.white,
                                            backgroundColor:
                                                CustomColors.primaryColor),
                                        child: const Text("Book"),
                                      )
                                    ],
                                  ),
                                ],
                              );
                            }),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 5),
                        child: FutureBuilder(
                            future: callVolunteer(widget.ds!["Volunteer"]),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        width: 80,
                                        height: 80,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      volunteerDet["Image"]))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        volunteerDet["Name"],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "All Time Available",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const UserVolunteerBooking()));
                                        },
                                        style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            foregroundColor: Colors.white,
                                            backgroundColor:
                                                CustomColors.primaryColor),
                                        child: const Text("Book"),
                                      )
                                    ],
                                  )
                                ],
                              );
                            }),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 5),
                        child: FutureBuilder(
                            future: callAmbulance(widget.ds!["Ambulance"]),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        width: 80,
                                        height: 80,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      ambulanceDet["Image"]))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ambulanceDet["Name"],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "All Time Available",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          FlutterPhoneDirectCaller.callNumber(
                                              ambulanceDet["Phone"]);
                                        },
                                        style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            foregroundColor: Colors.white,
                                            backgroundColor: Colors.red),
                                        child: const Text("Call"),
                                      )
                                    ],
                                  )
                                ],
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
