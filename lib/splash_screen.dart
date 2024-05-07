import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peaceful_pulse/officials_login_form.dart';
import 'package:peaceful_pulse/user/user_register_form.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserRegisterForm()));
                      },
                      child: const Text("User")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const OfficialsLoginForm()));
                      },
                      child: const Text("Officials")),
                ],
              )
            ],
          )),
    );
  }
}
