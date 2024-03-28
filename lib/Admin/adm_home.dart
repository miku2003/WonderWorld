import 'package:flutter/material.dart';
import 'package:wonderworld/Admin/emergency_section.dart';
import 'package:wonderworld/Admin/event_scheduling.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 195, 229, 247),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 50),
                child: Image.asset(
                  "assets/t1.png",
                  height: 30,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5, top: 6),
                child: Text(
                  "Admin Panel",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 220, top: 20),
                child: Text(
                  "Name : Test ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5, right: 125),
                child: Text(
                  "Email : test@gmail.com ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EmergencySection()),
                    );
                  },
                  child: Image.asset(
                    "assets/g1.png",
                    width: 280,
                    height: 250,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EventScheduling()),
                    );
                  },
                  child: Image.asset(
                    "assets/g2.png",
                    width: 280,
                    height: 250,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 60, right: 60, bottom: 100, top: 40),
                child: TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const SignUpPage()),
                    // );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 246, 122, 113),
                    elevation: 0,
                    padding: const EdgeInsets.all(17),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(1),
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
