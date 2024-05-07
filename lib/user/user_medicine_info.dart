import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peaceful_pulse/constants/custom_colors.dart';

class UserMedicineInfo extends StatefulWidget {
  const UserMedicineInfo({super.key});

  @override
  State<UserMedicineInfo> createState() => _UserMedicineInfoState();
}

class _UserMedicineInfoState extends State<UserMedicineInfo> {
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
        title: const Text(
          "Drug Details",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: CustomColors.secondaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/3,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey),
                  child: const Center(child: Text("Photo")),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Paracetamol [500mg]", style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Rs 150"),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Available"),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Container(decoration: BoxDecoration(color: Colors.yellowAccent, borderRadius: BorderRadius.circular(10)), child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("300mg"),
                  ),),
                  SizedBox(width: 10,),
                  Container(decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(10)), child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("500mg"),
                  ),),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)), child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
                  child: Text("Purchase"),
                ),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
