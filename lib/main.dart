import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wonderworld/Admin/adm_home.dart';
import 'package:wonderworld/firebase_options.dart';


void main() async {
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
      home: AdminHomeScreen(),
    );
  }
}
