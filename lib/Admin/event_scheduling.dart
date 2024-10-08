import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class EventScheduling extends StatefulWidget {
  const EventScheduling({super.key});

  @override
  State<EventScheduling> createState() => _EventSchedulingState();
}

class _EventSchedulingState extends State<EventScheduling> {
  final _form = GlobalKey<FormState>();
  var eventName = "";
  var eventTime = "";
  var place = "";
  var ticketPrice = "";
  var eventDescription = "";
  var _isAuthenticating = false;

  void _submit() async {
    var isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    setState(() {
      _isAuthenticating = true;
    });

    FocusScope.of(context).unfocus();

    _form.currentState!.save();

    await FirebaseFirestore.instance.collection("events").doc().set({
      "event-name": eventName,
      "event-time": eventTime,
      "place": place,
      "ticket-pice": ticketPrice,
      "event-description": eventDescription
    });

    setState(() {
      _isAuthenticating = false;
    });

    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 195, 229, 247),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _form,
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
                        onSaved: (value) {
                          eventName = value!;
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Enter a valid event name";
                          }
                          return null;
                        },
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
                        onSaved: (value) {
                          eventTime = value!;
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Enter a valid time";
                          }
                          return null;
                        },
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
                        onSaved: (value) {
                          place = value!;
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Enter a valid place";
                          }
                          return null;
                        },
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
                        onSaved: (value) {
                          ticketPrice = value!;
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Enter a ticket price";
                          }
                          return null;
                        },
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
                        onSaved: (value) {
                          eventDescription = value!;
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Enter a description";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                if (!_isAuthenticating)
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 60, right: 60, bottom: 100, top: 0),
                    child: TextButton(
                      onPressed: _submit,
                      style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 89, 173, 218),
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
                if (_isAuthenticating)
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 60, right: 60, bottom: 100, top: 0),
                    child: TextButton(
                      onPressed: _submit,
                      style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 89, 173, 218),
                        elevation: 0,
                        padding: const EdgeInsets.all(17),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      )),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
