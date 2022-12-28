import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:online_store_app/presentation/screens/admin_screen.dart';
import 'package:online_store_app/presentation/screens/home_screen.dart';
import 'package:online_store_app/presentation/widgets/home_body_widget.dart';
import 'package:sizer/sizer.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {

    final pages = [
 
  AdminScreen()
  // ignore: prefer_const_constructors

 
 

  ];
  int page=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: (Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        
        animationDuration: Duration(seconds: 1),
        backgroundColor: Colors.white,
        // ignore: prefer_const_constructors
        color: Color.fromARGB(200, 0, 0, 255),
        items: <Widget>[
          Icon(Icons.home, size: 5.h,color: Colors.white,),
          Icon(Icons.calculate_outlined, size: 5.h,color: Colors.white,),
          Icon(Icons.timer, size: 5.h,color: Colors.white,),
          Icon(
            Icons.manage_accounts_rounded,
            size: 5.h,color: Colors.white,
          )
        ],
        onTap: (index) {
          setState(() {
            page=index;
            
          });
        },
      ),body: pages[page],
    )
    )
    );
  }
}