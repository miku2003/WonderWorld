import 'package:flutter/material.dart';

class EmergencySection extends StatefulWidget {
  const EmergencySection({super.key});

  @override
  State<EmergencySection> createState() => _EmergencySectionState();
}

class _EmergencySectionState extends State<EmergencySection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 245, 213, 213),
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
                  "Emergency\n   Section",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 5, top: 20),
                child: Text(
                  "Lost Kid",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 187, 94, 60)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
                child: Container(
                  color: Colors.grey[200],
                  child: SizedBox(
                    height: 55,
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: 'Kid Name',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: Container(
                  color: Colors.grey[200],
                  child: SizedBox(
                    height: 55,
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: 'Kid Age',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: Container(
                  color: Colors.grey[200],
                  child: SizedBox(
                    height: 55,
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: 'Last Place Saw',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: Container(
                  color: Colors.grey[200],
                  child: SizedBox(
                    height: 55,
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: 'Last Place Saw',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: Container(
                  color: Colors.grey[200],
                  child: SizedBox(
                    height: 55,
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: 'Last Place Saw',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 60, right: 60, bottom: 100, top: 40),
                child: TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => ()),
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
                        "Submit Details",
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
