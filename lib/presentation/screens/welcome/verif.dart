

import 'package:flutter/material.dart';
import 'package:online_store_app/presentation/screens/welcome/login_screen.dart';

import '../../../core/components.dart';



// ignore: camel_case_types
class verify extends StatelessWidget {
  const verify({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              
              
               
              children: [
                SizedBox(height: 20,),
              CircleAvatar(
                        maxRadius: 90.0,
                        child: Image.asset(
                          "assets/veify.png",width: 130,
                        ),
                      ),
                      const Text('Please verify your email',style:TextStyle(fontSize:25,fontWeight: FontWeight.bold),)

                      ,const SizedBox(height: 10,)
                      ,const Text('A verification email has been sent to your please check your mailbox to verify the account before you sign',style: TextStyle(fontSize: 18),)
                      ,SizedBox(height: 50,)
                      ,ElevatedButton(onPressed: (){navigateAndFinish(context, LoginScreen());}, child:Text('Sign IN'))
            ]),
          ),
        ),
      );
    


  }
}


