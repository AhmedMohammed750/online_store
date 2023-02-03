

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
                const SizedBox(height: 20,),
              CircleAvatar(
                        maxRadius: 90.0,
                        child: Image.network(
                          "https://firebasestorage.googleapis.com/v0/b/online-store-50ede.appspot.com/o/image%20orginal%2Fveify.png?alt=media&token=678a45a1-de70-44e1-be0f-5d8d3b0a8da1",width: 130,
                        ),
                      ),
                      const Text('Please verify your email',style:TextStyle(fontSize:25,fontWeight: FontWeight.bold),)

                      ,const SizedBox(height: 10,)
                      ,const Text('A verification email has been sent to your please check your mailbox to verify the account before you sign',style: TextStyle(fontSize: 18),)
                      ,const SizedBox(height: 50,)
                      ,ElevatedButton(onPressed: (){navigateAndFinish(context, const LoginScreen());}, child:const Text('Sign IN'))
            ]),
          ),
        ),
      );
    


  }
}


