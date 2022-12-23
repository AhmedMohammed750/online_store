// Packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:online_store_app/presentation/screens/profilescreen.dart';
import 'package:sizer/sizer.dart';

import '../../core/components.dart';
import 'home_screen.dart';
import 'welcome/login_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 5, 2, 56),
        title: const Text('Admin Screen'),
        centerTitle: true,
      actions: [IconButton(
            onPressed: () async{
              await FirebaseAuth.instance.signOut();

              // ignore: use_build_context_synchronously
              navigateAndFinish(context, LoginScreen());
            },
            icon: const Icon(Icons.login_rounded),
          ),],
      ),drawer: GFDrawer(
        // ignore: prefer_const_constructors
        color: Color.fromARGB(255, 13, 2, 56),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GFDrawerHeader(
              currentAccountPicture: const GFAvatar(
                radius: 100.0,
                backgroundColor: Color.fromARGB(255, 3, 2, 56),
                backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/online-store-50ede.appspot.com/o/image%20orginal%2Fadmin.gif?alt=media&token=a53c0b16-ccca-4183-ab04-476ded2226bd"),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  Text(
                    '2'.tr,
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('9'.tr,
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            ListTile(
              title: Text(
                '1'.tr,
                // ignore: prefer_const_constructors
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
            ),
            ListTile(
              title: Text('6'.tr,
                  // ignore: prefer_const_constructors
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  Profile()));
              },
            ),
            ListTile(
              title: Text('7'.tr,
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
              onTap: () {
                
              },
            ),
            ListTile(
              title: Text('8'.tr,
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
              onTap: () {
               
              },
            ),
            Column(
              children: [
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                  ],
                )
              ],
            )
          ],
        ),
      ),
      body:Container(height:90.h,width: 100.w, child:Image.asset('assets/admin.gif'),) 
      
    );
  }
  
  void _launchUrl2() {}
}
