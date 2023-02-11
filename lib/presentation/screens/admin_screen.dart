// Packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:online_store_app/presentation/screens/addproduct.dart';
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
                backgroundImage: NetworkImage('https://firebasestorage.googleapis.com/v0/b/online-store-50ede.appspot.com/o/image%20orginal%2Fimages.png?alt=media&token=57edff90-a804-42bc-9a13-bd39944815bc')
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
              title: Text('21'.tr,
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Addproduct()));
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
              title: Text('20'.tr,
                  // ignore: prefer_const_constructors
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) =>  Profile1()));
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
      body:Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/online-store-50ede.appspot.com/o/image%20orginal%2Fadmin.gif?alt=media&token=a53c0b16-ccca-4183-ab04-476ded2226bd',
                  fit: BoxFit.fill,height: 100.h,width: 100.w,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
      
    ));
  }
  
  void _launchUrl2() {}
}
