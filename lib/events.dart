import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 234, 253),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Image.asset(
              "assets/t1.png",
              width: 200,
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 16,
                left: 32,
                right: 32,
              ),
              child: Text(
                "Event Schedule",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("events").snapshots(),
              builder: (cxt, chatSnapshot) {
                if (chatSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (!chatSnapshot.hasData || chatSnapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text("No events yet"),
                  );
                }

                if (chatSnapshot.hasError) {
                  return const Center(
                    child: Text("Somthing went wrong"),
                  );
                }

                final loadedData = chatSnapshot.data!.docs;
                print(
                    "...................................................................................${loadedData.length}");

                return Expanded(
                  child: ListView.builder(
                    reverse: false,
                    itemCount: loadedData.length,
                    padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                    itemBuilder: (context, index) {
                      final currentData = loadedData[index].data();

                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: const DecorationImage(
                                          image:
                                              AssetImage('assets/google.png'),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      height: 100,
                                      width: 100,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          currentData["event-name"].length > 12
                                              ? currentData["event-name"]
                                                      .substring(0, 12) +
                                                  '...'
                                              : currentData["event-name"],
                                          style: const TextStyle(fontSize: 30),
                                        ),
                                        Text(
                                          currentData["event-description"],
                                          maxLines: 2,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(currentData["place"]),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Container(
                                        width: 180,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color.fromARGB(
                                              255, 85, 178, 105),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Ticket Price: LRK ${currentData["ticket-pice"]}",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: Container(
                                        width: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color.fromARGB(
                                              255, 85, 178, 105),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Time: ${currentData["event-time"]}",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
