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
enum BookingTime { am10, pm12, pm3 }
late DateTime? bookDate;
final TextEditingController bookDateController= TextEditingController();

class _UserDoctorBookingState extends State<UserDoctorBooking> {
  BookingTime? bookingTime = BookingTime.am10;


  Future<void> bookingDateSelect(BuildContext context) async {
    bookDate = DateTime(2024, 1, 1);
    final DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: bookDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2027),
    );
    if (newSelectedDate != null) {
      setState(() {
        bookDateController.text = newSelectedDate.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: CustomColors.secondaryColor,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(CupertinoIcons.back, color: Colors.black,)),
      ),
      body: SingleChildScrollView(
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
                        // Text(
                        //   widget.ds?["Designation"],
                        // ),
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
                              "Select Date",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            SizedBox(width: 20,),
                            SizedBox(
                              width: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  controller: bookDateController,
                                  validator: (date){
                                    if (date== null || date.isEmpty){
                                      return 'Please enter a Mfg date';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    fillColor: CustomColors.primaryColor,
                                      filled: true,
                                      hintText: 'Date',
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10))),
                                      suffixIcon: IconButton(
                                          onPressed: () => bookingDateSelect(context),
                                          icon: const Icon(
                                            CupertinoIcons.calendar,
                                            color: CustomColors.secondaryColor,
                                          ))),
                                ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Text("10 AM", style: TextStyle(fontWeight: FontWeight.bold),),
                                Radio<BookingTime>(
                                    value: BookingTime.am10,
                                    groupValue: bookingTime,
                                    onChanged: (BookingTime? value) {
                                      setState(() {
                                        bookingTime = value;
                                      });
                                    },
                                  ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text("12 PM", style: TextStyle(fontWeight: FontWeight.bold),),
                                Radio<BookingTime>(
                                    value: BookingTime.pm12,
                                    groupValue: bookingTime,
                                    onChanged: (BookingTime? value) {
                                      setState(() {
                                        bookingTime = value;
                                      });
                                    },
                                  ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text("3 PM", style: TextStyle(fontWeight: FontWeight.bold),),
                                Radio<BookingTime>(
                                    value: BookingTime.pm3,
                                    groupValue: bookingTime,
                                    onChanged: (BookingTime? value) {
                                      setState(() {
                                        bookingTime = value;
                                      });
                                    },
                                  ),
                              ],
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
