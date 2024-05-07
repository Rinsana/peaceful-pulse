import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';

class UserEditProfile extends StatefulWidget {
  const UserEditProfile({super.key});

  @override
  State<UserEditProfile> createState() => _UserEditProfileState();
}

class _UserEditProfileState extends State<UserEditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.secondaryColor,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(CupertinoIcons.back)),
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
                        const Text(
                          "Edit Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const CircleAvatar(
                          backgroundImage: NetworkImage('https://s3-alpha-sig.figma.com/img/5e0b/f813/95ed55c8b7749a5a9d987d8c672265d4?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LLbLKHk1EdpEB2an0LvQyUT2OM8TEfpoBuBlMD8TO3QUa4b0L9ljJkHij4gXP47fB-RaZANc1ZU7topEa-IjgXlEZzFT5PqZvlqZ8~Gx8uEY71Ebnj4z~g-yOZp8k6T8C4JQUTEUPQ8QpE08Sn6jiDX4DqF86TS7cSWRUYllxmHvvCtf3L3xsUDhO3oZiV47AQE52e0zy20MfvJxuglr9Z24fzpHxY9v1JsQ0t4-7qfR1amSv8GkaZN1hNxFhItTUBY6FomitflONIOoPBiuYmk8Ia45eV-6iQdCKsYkBsSwNS0j0dssAjPjnXoQZPjhAWAxN9pkt079cuKDcS7vdg__'),
                          backgroundColor: Colors.grey,
                          radius: 30,
                        ),
                        const SizedBox(height: 50,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Personal",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintStyle: const TextStyle(
                                  color: CustomColors.secondaryColor),
                              hintText: "Name",
                              filled: true,
                              fillColor: CustomColors.primaryColor,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          style: const TextStyle(
                              color: CustomColors.secondaryColor),
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintStyle: const TextStyle(
                                  color: CustomColors.secondaryColor),
                              hintText: "Email Address",
                              filled: true,
                              fillColor: CustomColors.primaryColor,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          style: const TextStyle(
                              color: CustomColors.secondaryColor),
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              hintStyle: const TextStyle(
                                  color: CustomColors.secondaryColor),
                              hintText: "Phone Number",
                              filled: true,
                              fillColor: CustomColors.primaryColor,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          style: const TextStyle(
                              color: CustomColors.secondaryColor),
                        ),
                        const SizedBox(height: 30,),
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
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: Text(
                                "Save",
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
