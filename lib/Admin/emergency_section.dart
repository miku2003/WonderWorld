import 'package:cloud_firestore/cloud_firestore.dart';
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
      backgroundColor: const Color.fromARGB(255, 245, 213, 213),
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
                "Emergency Alerts",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("emergency")
                  .snapshots(),
              builder: (cxt, chatSnapshot) {
                if (chatSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (!chatSnapshot.hasData || chatSnapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text("No current alerts"),
                  );
                }

                if (chatSnapshot.hasError) {
                  return const Center(
                    child: Text("Somthing went wrong"),
                  );
                }

                final loadedData = chatSnapshot.data!.docs;
                // ignore: avoid_print
                print(
                    "...................................................................................${loadedData.length}");

                return Expanded(
                  child: ListView.builder(
                    reverse: false,
                    itemCount: loadedData.length,
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
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          currentData["name"],
                                          style: const TextStyle(fontSize: 30),
                                        ),
                                        Text(currentData["description"]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            "Parent No: ${currentData["contact-number"]}"),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          255, 85, 178, 105),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        currentData["last-place"],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
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
