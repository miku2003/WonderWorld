import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wonderworld/Admin/adm_login.dart';
import 'package:wonderworld/home_page.dart';
import 'package:wonderworld/password_reset_page.dart';
import 'package:wonderworld/sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final _auth = FirebaseAuth.instance;

  bool isObsecured = true;
  bool isEmailValid = true;

  Future login() async {
    await _auth
        .signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        )
        .then(
          (value) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          ),
        );
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

                  // email
                  SizedBox(
                    height: 60,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: isEmailValid ? Colors.blue : Colors.red,
                            width: 2,
                          ),
                        ),
                        hintText: 'Email Address',
                      ),
                      onChanged: (value) => setState(() {
                        isEmailValid = emailRegExp.hasMatch(value);
                      }),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // password
                  SizedBox(
                    height: 60,
                    child: TextFormField(
                      controller: _passwordController,
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

                  // forgot password text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PasswordResetPage()),
                          );
                        },
                        child: const Text('Forgot Password?'),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // sign in button
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      // onPressed: login,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const HomePage(),
                          ),
                        );
                      },
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
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // facebook sign in
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.grey),
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // icon
                          Image.asset(
                            'assets/fblogo.png',
                            width: 25,
                            height: 25,
                          ),

                          const Text(
                            'Continue with Facebook',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // google sign in
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.grey),
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // icon
                          Image.asset(
                            'assets/google.png',
                            width: 25,
                            height: 25,
                          ),
                          const Text(
                            'Continue with Google',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('New User?'),
                      const SizedBox(
                        width: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      // onPressed: login,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const AdminLoginPage(),
                          ),
                        );
                      },
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
                        'Admin Log In',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
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
    );
  }
}
