// Packages
// ignore_for_file: prefer_const_constructors






import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

// Screens
import 'package:online_store_app/presentation/screens/home_screen.dart';
import 'package:online_store_app/presentation/screens/welcome/register_screen.dart';


// Core
import '../../../core/components.dart';

class LoginScreen extends StatefulWidget {
  

  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  // Keys are used to find a specific widget
  final _formKey = GlobalKey<FormState>();

  signin()async{
    
  
    var formdate=_formKey.currentState;

 
    if (formdate!.validate()  ){
      formdate.save();
  
      try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email.text,
    password: password.text
    
    
    
  );
  return credential;
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found' ) {
              // ignore: avoid_single_cascade_in_expression_statements
              AwesomeDialog(
            context:context,
            animType: AnimType.scale,
            dialogType: DialogType.info,
            body: Center(
              child: Text(
                'No user found for that email.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            title: 'Erorr Email',
            btnOkOnPress: () {},
          )..show();
    // ignore: avoid_single_cascade_in_expression_statements
    
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
              // ignore: avoid_single_cascade_in_expression_statements
              AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.info,
            body: Center(
              child: Text(
                'Wrong password provided for that user.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            title: 'Erorr Password',
            btnOkOnPress: () {},
          )..show();
    
  } else if(e.code=='emailVerified'){
    print('not verfied');
  }
}



    }else{
                   // ignore: avoid_single_cascade_in_expression_statements
                   AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.info,
            body: Center(
              child: Text(
                'your account is not activated go to email for activating it ',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            title: 'Error',
            btnOkOnPress: () {},
          )..show();
    }



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 90, 143, 187),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              // This widget is used for validation
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 80.0,
                    child: Image.asset(
                      "assets/splash.png",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Online Store!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Welcome back, you 've been missed!",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
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
                            if (value!.isEmpty ||
                                !EmailValidator.validate(value)) {
                              return 'Email address is not valid';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
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
                          controller: password,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.password,
                              color: Colors.white,
                            ),
                            border: InputBorder.none,
                            hintText: "Enter Password",
                            hintStyle: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Password must not be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: SizedBox(
                          height: 40,
                          width: 200,
                          child: TextButton(
                            child: const Text(
                              "Log In",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () async{
                             var user=await signin();
                              if (user!=null) {
                                navigateAndFinish(context, const HomeScreen());
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Not a member?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                         navigateAndFinish(context, RegisterScreen());
                        },
                        child: const Text(
                          'Register Now',
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
