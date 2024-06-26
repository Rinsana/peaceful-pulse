import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:peaceful_pulse/user/splash_screen.dart';
import 'package:peaceful_pulse/user_select.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peaceful Pulse',
      home: SplashScreen(),
    );
  }
}
