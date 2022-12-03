// Packages

// ignore_for_file: prefer_const_constructors, unnecessary_this

import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_store_app/presentation/screens/welcome/verif.dart';
import '../home_screen.dart';

// Screens
import 'package:online_store_app/presentation/screens/welcome/login_screen.dart';

// Core
import '../../../core/components.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController passwordConfirm = TextEditingController();

  final TextEditingController phoneNumber = TextEditingController();

  // Keys are used to find a specific widget
  final _formKey = GlobalKey<FormState>();

  signUp() async {
    var formate = _formKey.currentState;
    if (formate!.validate()) {
      formate.save();
      try {
        UserCredential credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        if (credential.user?.emailVerified == false) {
          User? user = FirebaseAuth.instance.currentUser;
          await user?.sendEmailVerification();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          // ignore: avoid_single_cascade_in_expression_statements
          AwesomeDialog(
            context: this.context,
            animType: AnimType.scale,
            dialogType: DialogType.info,
            body: Center(
              child: Text(
                'The password provided is too weak.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            title: 'Erorr Password',
            btnOkOnPress: () {},
          )..show();
        } else if (e.code == 'email-already-in-use') {
          // ignore: avoid_single_cascade_in_expression_statements
          AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.info,
            body: Center(
              child: Text(
                'The account already exists for that email.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            title: 'Error Email',
            btnOkOnPress: () {},
          )..show();
        }
      }
    }
  }

  @override
  // ignore: duplicate_ignore
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 90, 143, 187),
        elevation: 0.0,
        leading: BackButton(
          onPressed: () {
            navigateAndFinish(context, LoginScreen());
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 90, 143, 187),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              // This widget is used for validation
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 25,
                      ),
                      CircleAvatar(
                          maxRadius: 40.0,
                          child: Image.asset(
                            "assets/splash.png",
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        "Online Store!",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Create New Account",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white70),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: TextFormField(
                            maxLength: 11,
                            controller: phoneNumber,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.phone_android_outlined,
                                color: Colors.white,
                              ),
                              border: InputBorder.none,
                              hintText: "Enter Phone Number",
                              hintStyle: TextStyle(
                                color: Colors.white54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            validator: (String? value) {
                              try {
                                if (value!.isEmpty) {
                                  return 'Phone Number must not be empty';
                                }
                                return null;
                              } catch (e) {}
                            },
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white70),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: TextFormField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                            ),
                            border: InputBorder.none,
                            hintText: "Enter Email Address",
                            hintStyle: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          validator: (String? value) {
                            try {
                              if (value!.isEmpty ||
                                  !EmailValidator.validate(value)) {
                                return 'Email address is not valid';
                              }
                              return null;
                            } catch (e) {
                              print('error');
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white70)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: TextFormField(
                          controller: password,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.password,
                              color: Colors.white,
                            ),
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          validator: (String? value) {
                            try {
                              if (value!.isEmpty) {
                                return 'Password must not be empty';
                              }
                              return null;
                            } catch (e) {}
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.white70)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: TextFormField(
                            controller: passwordConfirm,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.password,
                                color: Colors.white,
                              ),
                              border: InputBorder.none,
                              hintText: "Confirm Password",
                              hintStyle: TextStyle(
                                  color: Colors.white54,
                                  fontWeight: FontWeight.bold),
                            ),
                            validator: (String? value) {
                              try {} catch (e) {
                                if (value!.isEmpty) {
                                  return 'Confirm Password must not be empty';
                                }
                                if (password.text != passwordConfirm.text) {
                                  return 'Confirm Password is non identical';
                                }
                                return null;
                              }
                            },
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: SizedBox(
                          height: 40,
                          child: TextButton(
                            onPressed: () async {
                              UserCredential? respon = await signUp();
                              print('===============');
                              if (respon == null) {
                                // ignore: use_build_context_synchronously
                                navigateAndFinish(context, verify());
                                print('its work');
                              } else {
                                print('===============');
                              }
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
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
        ),
      ),
    );
  }
}
