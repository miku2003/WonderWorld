import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class Test extends StatefulWidget {
  Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final _form = GlobalKey<FormState>();
  var name = "";
  var age = "";
  var lastPlace = "";
  var contactNumber = "";
  var description = "";
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

    await FirebaseFirestore.instance.collection("emergency").doc().set({
      "name": name,
      "age": age,
      "last-place": lastPlace,
      "contact-number": contactNumber,
      "description": description,
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
          color: Color.fromARGB(255, 245, 213, 213),
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
                        onSaved: (value) {
                          name = value!;
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Enter a name";
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
                          hintText: 'Kid Age',
                        ),
                        onSaved: (value) {
                          age = value!;
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Enter a valid age";
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
                          hintText: 'Last Place Saw',
                        ),
                        onSaved: (value) {
                          lastPlace = value!;
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
                          hintText: 'Parent contact number',
                        ),
                        onSaved: (value) {
                          contactNumber = value!;
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Enter a valid contact number";
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
                          hintText: 'Small Decscription',
                        ),
                        onSaved: (value) {
                          description = value!;
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
                            const Color.fromARGB(255, 246, 122, 113),
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
                if (_isAuthenticating)
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 60, right: 60, bottom: 100, top: 0),
                    child: TextButton(
                      onPressed: _submit,
                      style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 246, 122, 113),
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
