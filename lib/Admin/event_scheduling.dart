import 'package:flutter/material.dart';

class EventScheduling extends StatefulWidget {
  const EventScheduling({super.key});

  @override
  State<EventScheduling> createState() => _EventSchedulingState();
}

class _EventSchedulingState extends State<EventScheduling> {
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
                padding: EdgeInsets.only(left: 10, top: 6),
                child: Text(
                  "Event",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 1),
                child: Text(
                  "Scheduling",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 2, top: 20),
                child: Text(
                  "Schedule an Event",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 75, 137, 170),
                  ),
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
                        hintText: 'Event Name',
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
                        hintText: 'Event Time',
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
                        hintText: 'Place',
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
                        hintText: 'Ticket Price',
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
                        hintText: 'Event Description',
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
                    backgroundColor:const Color.fromARGB(255, 89, 173, 218),
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
                        "Schedule Event",
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
