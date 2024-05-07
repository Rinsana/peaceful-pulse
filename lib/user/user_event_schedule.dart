import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';

class UserEventSchedule extends StatefulWidget {
  const UserEventSchedule({super.key});

  @override
  State<UserEventSchedule> createState() => _UserEventScheduleState();
}

class _UserEventScheduleState extends State<UserEventSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.secondaryColor,
        title: const Text(
          "Medical Camp Events",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.black,
            )),
      ),
      body: Container(
        color: CustomColors.secondaryColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, top: 70, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Free Medical Camp at Muthukad Tribal Colony",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text("on 15-06-2024"),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(onPressed: () {}, child: Text("See more", style: TextStyle(color: Colors.lightBlue),))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Free Medical Camp at Muthukad Tribal Colony",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text("on 15-06-2024"),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(onPressed: () {}, child: Text("See more", style: TextStyle(color: Colors.lightBlue),))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Free Medical Camp at Muthukad Tribal Colony",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text("on 15-06-2024"),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(onPressed: () {}, child: Text("See more", style: TextStyle(color: Colors.lightBlue),))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Free Medical Camp at Muthukad Tribal Colony",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text("on 15-06-2024"),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(onPressed: () {}, child: Text("See more", style: TextStyle(color: Colors.lightBlue),))
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(decoration: BoxDecoration(color: Colors.black,), child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15),
                child: Text("Register Now", style: TextStyle(color: Colors.white),),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
