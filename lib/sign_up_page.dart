import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wonderworld/home_page.dart';
import 'package:wonderworld/sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNamedController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isObsecured = true;
  bool isChecked = false;

  Future signUp() async {
    if (passwordController.text == confirmPasswordController.text) {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // add user details to database
      FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user!.email)
          .set({
        'firstName': firstNamedController.text,
        'lastName': lastNameController.text,
      }).then(
        (value) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Passwords do not match',
          ),
        ),
      );
    }
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // title
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0, left: 40),
                    child: Image.asset('assets/title.png'),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  // first name
                  SizedBox(
                    height: 55,
                    child: TextFormField(
                      controller: firstNamedController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'First Name',
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // last name
                  SizedBox(
                    height: 55,
                    child: TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Last Name',
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // email
                  SizedBox(
                    height: 55,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Email Address',
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // password
                  SizedBox(
                    height: 55,
                    child: TextFormField(
                      controller: passwordController,
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
                        ),
                        hintText: 'Password',
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // confirm password
                  SizedBox(
                    height: 55,
                    child: TextFormField(
                      controller: confirmPasswordController,
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
                        ),
                        hintText: 'Confirm Password',
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  // Check Box
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: isChecked,
                        fillColor: MaterialStateColor.resolveWith((states) {
                          if (states.contains(MaterialState.selected)) {
                            return Colors.blue;
                          }
                          return Colors.white;
                        }),
                        onChanged: (value) => setState(() {
                          isChecked = !isChecked;
                        }),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'I agree to the terms and conditions',
                        ),
                      ),
                    ],
                  ),

                  // sign up button
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: signUp,
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
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Sign In text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SignInPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
