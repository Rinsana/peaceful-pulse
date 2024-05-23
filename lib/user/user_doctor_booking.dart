import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peaceful_pulse/constants/custom_colors.dart';

class UserDoctorBooking extends StatefulWidget {
  const UserDoctorBooking({super.key, required this.ds});
  
  final DocumentSnapshot? ds;

  @override
  State<UserDoctorBooking> createState() => _UserDoctorBookingState();
}

class _UserDoctorBookingState extends State<UserDoctorBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.secondaryColor,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(CupertinoIcons.back, color: Colors.black,)),
      ),
      body: Container(
        color: CustomColors.secondaryColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        Text(
                          "Doctor",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: widget.ds!.exists
                              ? Image.network(widget.ds?["Image"],)
                              : const Center(child: Text("Photo")),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          widget.ds?["Name"],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          widget.ds?["Designation"],
                        ),
                        const SizedBox(height: 30,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Biography",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            SizedBox(
                              child: Text(
                                  "A doctor is a medical professional who has completed the necessary education and training to diagnose, treat, and prevent illnesses and injuries in individuals."),
                              width: MediaQuery.of(context).size.width - 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Available Dates",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              decoration: BoxDecoration(color: CustomColors.primaryColor, borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("21-02-2024", style: TextStyle(color: Colors.white),),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        const Row(
                          children: [
                            Text(
                              "Available Time",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Container(
                              color: Colors.yellowAccent,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("10 : 00 AM",),
                              ),
                            ),
                            Spacer(),
                            Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("10 : 00 AM",),
                              ),
                            ),
                            Spacer(),
                            Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("10 : 00 AM",),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(5)),
                                foregroundColor: Colors.white,
                                backgroundColor:
                                CustomColors.primaryColor),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                              child: Text(
                                "Book Now",
                                style: TextStyle(
                                    color: CustomColors.secondaryColor),
                              ),
                            )),
                        SizedBox(height: 15,),
                        TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(5)),
                                foregroundColor: Colors.white,
                                backgroundColor:
                                CustomColors.primaryColor),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                              child: Text(
                                "Message",
                                style: TextStyle(
                                    color: CustomColors.secondaryColor),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
