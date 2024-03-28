import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final _form = GlobalKey<FormState>();
  final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  bool isObsecured = true;
  bool isEmailValid = true;
  var isAuthenticating = false;
  var _enteredEmail = "";
  var _enteredPassword = "";

  void _submit() async {
    final isValid = _form.currentState!.validate();

    if (!isValid) {
      return;
    }

    FocusScope.of(context).unfocus();
    _form.currentState!.save();

    setState(() {
      isAuthenticating = true;
    });

    print(_enteredEmail);
    print(_enteredPassword);

    // try {
    //   await _firebase.signInWithEmailAndPassword(
    //     email: _enteredEmail,
    //     password: _enteredPassword,
    //   );
    // } on FirebaseAuthException catch (error) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(error.message ?? "Signin faild"),
    //     ),
    //   );
    //   setState(() {
    //     isAuthenticating = false;
    //   });
    //   return;
    // }
    setState(() {
      isAuthenticating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _form,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // title
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50.0, left: 40),
                      child: Image.asset('assets/title.png'),
                    ),

                    const Text(
                      "Admin Login",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(0, 202, 207, 202),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0),
                              width: 2,
                            ),
                          ),
                          hintText: "Enter your Email",
                          hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Outfit-Regular",
                              color: Color.fromARGB(255, 91, 91, 91)),
                        ),
                        onSaved: (value) {
                          _enteredEmail = value!;
                        },
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              !value.contains("@")) {
                            return "Enter a valid email address";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(0, 202, 207, 202),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: TextFormField(
                        obscureText: isObsecured,
                        decoration: InputDecoration(
                          
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: GestureDetector(
                          onTap: () => setState(() {
                            isObsecured = !isObsecured;
                          }),
                          child: Icon(
                            isObsecured
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0),
                              width: 2,
                            ),
                          ),
                          hintText: "Enter your Email",
                          hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Outfit-Regular",
                              color: Color.fromARGB(255, 91, 91, 91)),
                        ),
                        onSaved: (value) {
                          _enteredPassword = value!;
                        },
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty) {
                            return "Enter a password";
                          }
                          return null;
                        },
                      ),
                    ),
                    // forgot password text

                    const SizedBox(
                      height: 20,
                    ),

                    // sign in button
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submit,
                       
                        style: ButtonStyle(
                          shadowColor: MaterialStateProperty.all(Colors.grey),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.blue[400],
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
