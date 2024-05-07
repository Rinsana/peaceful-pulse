import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peaceful_pulse/constants/custom_colors.dart';

class UserAmbulanceCall extends StatefulWidget {
  const UserAmbulanceCall({super.key});

  @override
  State<UserAmbulanceCall> createState() => _UserAmbulanceCallState();
}

class _UserAmbulanceCallState extends State<UserAmbulanceCall> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: CustomColors.secondaryColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            CupertinoIcons.search,
                            color: CustomColors.primaryColor,
                          ),
                          hintText: 'Search location',
                          hintStyle: TextStyle(color: CustomColors.primaryColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5),
                            child: Container(
                              height: 150,
                              decoration: const BoxDecoration(
                                color: Colors.teal,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(8)),
                                      width: 100,
                                      height: 100,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.deepPurple)
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Ambulance",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                            width: 150,
                                            child: Text(
                                              "Angadippuram",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400, color: Colors.white),
                                            )),
                                        TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                              foregroundColor: Colors.white,
                                              backgroundColor:
                                              Colors.redAccent),
                                          child: const Text("Call"),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}
