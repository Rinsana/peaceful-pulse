import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peaceful_pulse/user/user_forgot_password.dart';
import 'package:peaceful_pulse/user/user_home.dart';

import '../constants/custom_colors.dart';

class UserLoginForm extends StatefulWidget {
  const UserLoginForm({super.key});

  @override
  State<UserLoginForm> createState() => _UserLoginFormState();
}

class _UserLoginFormState extends State<UserLoginForm> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: CustomColors.primaryColor),
            child: const Column(
              children: [
                Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: Text(
                    "PEACEFUL PULSE",
                    style: TextStyle(
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.normal,
                        color: CustomColors.secondaryColor),
                  ),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: CustomColors.secondaryColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 50.0,
                  right: 20,
                  left: 20,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    child: Column(
                      children: [
                        const Center(
                            child: Text(
                          "LOGIN",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: CustomColors.primaryColor),
                        )),
                        const SizedBox(
                          height: 30,
                        ),
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
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: _isObscured,
                          enabled: true,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObscured = !_isObscured;
                                  });
                                },
                                icon: _isObscured
                                    ? const Icon(CupertinoIcons.eye_slash)
                                    : const Icon(CupertinoIcons.eye),
                                color: CustomColors.secondaryColor,
                              ),
                              hintStyle: const TextStyle(
                                  color: CustomColors.secondaryColor),
                              hintText: "Password",
                              filled: true,
                              fillColor: CustomColors.primaryColor,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          style: const TextStyle(
                              color: CustomColors.secondaryColor),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const UserForgotPassword()));
                                },
                                child: const Text(
                                  "Forgot Password",
                                  style: TextStyle(color: Colors.black),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const UserHome()));
                                  },
                                  style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      foregroundColor: Colors.white,
                                      backgroundColor:
                                          CustomColors.primaryColor),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: CustomColors.secondaryColor),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("----------------OR------------------"),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(FontAwesomeIcons.google)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(FontAwesomeIcons.facebook)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(FontAwesomeIcons.twitter))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
