import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:online_store_app/data/firebase.dart';

class Profile extends StatelessWidget {
   Profile({super.key});
   
   
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 2, 32, 56),
      ),
      body:Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          
          children: const [
            Text('Name: '),
            SizedBox(height:5,),
            Text('created:'),
            

          ],
        ),
      ),
    );
  }
}
