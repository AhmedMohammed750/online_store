
// ignore_for_file: override_on_non_overriding_member

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwidget/getwidget.dart';
import 'package:online_store_app/presentation/screens/admin_screen.dart';
import 'package:online_store_app/presentation/screens/cartscreen.dart';
import 'package:online_store_app/presentation/screens/profilescreen.dart';
import 'package:online_store_app/presentation/screens/welcome/login_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/components.dart';
import '../controllers/locale/locale_controller.dart';
import '../widgets/home_body_widget.dart';
import '../widgets/themes.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

 

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  var colo = 1;

  final Uri _url = Uri.parse(
      'https://sites.google.com/view/watereject/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A9-%D8%A7%D9%84%D8%B1%D8%A6%D9%8A%D8%B3%D9%8A%D8%A9');
  final Uri _url2 = Uri.parse('mailto:kosayalmansour@gmail.com');

  // ignore: non_constant_identifier_names
  void _launchUrl() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  void _launchUrl2() async {
    if (!await launchUrl(_url2)) throw 'Could not launch $_url';
  }


      final pages=[
   HomeBodyWidget(),
    const Cart()


  ];
  int page=0;

 

 


  @override
  Widget build(BuildContext context) {
    LocaleController contlor = Get.find();
    return Scaffold(
      bottomNavigationBar:CurvedNavigationBar(
        height: 10.h,
        animationDuration: const Duration(milliseconds: 300),
       backgroundColor: Colors.white,
        color:Color.fromARGB(255, 2, 32, 56),
        items: const [
        Icon(Icons.home,),
        Icon(Icons.shopping_cart),
        
      ],
      onTap: (index){
        setState(() {
          page=index;
        });

      },

      ),
     
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async{
              await FirebaseAuth.instance.signOut();

              // ignore: use_build_context_synchronously
              navigateAndFinish(context, LoginScreen());
            },
            icon: const Icon(Icons.login_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(onPressed:(){
             ThemeService().changeTheme();
   
          }, icon:Icon(Icons.dark_mode))
        ],
        // ignore: prefer_const_constructors
        backgroundColor: Color.fromARGB(255, 2, 32, 56),
        elevation: 20,
        toolbarHeight: 60,
        // ignore: prefer_const_constructors
        title: Text(
          '1'.tr,
        ),
        centerTitle: true,
      ),
      drawer: GFDrawer(
        // ignore: prefer_const_constructors
        color: Color.fromARGB(255, 2, 32, 56),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GFDrawerHeader(
              currentAccountPicture: const GFAvatar(
                radius: 100.0,
                backgroundColor: Color.fromARGB(255, 2, 32, 56),
                backgroundImage: AssetImage("assets/splash.png"),
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
                _launchUrl2();
              },
            ),
            ListTile(
              title: Text('8'.tr,
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
              onTap: () {
                _launchUrl();
              },
              
            ),
            Column(
              children: [
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GFButton(
                        shape: GFButtonShape.pills,
                        onPressed: () {
                          contlor.changeLanguage("en");
                          setState(() {
                            colo = 1;
                          });
                        },
                        color: (colo == 1) ? GFColors.DANGER : GFColors.PRIMARY,
                        text: "4".tr),
                    const SizedBox(
                      width: 5,
                    ),
                    GFButton(
                        shape: GFButtonShape.pills,
                        onPressed: () {
                          contlor.changeLanguage("ar");
                          setState(() {
                            colo = 2;
                          });
                        },
                        color: (colo == 2) ? GFColors.DANGER : GFColors.PRIMARY,
                        text: "3".tr),
                    const SizedBox(
                      width: 5,
                    ),
                    GFButton(
                        shape: GFButtonShape.pills,
                        onPressed: () {
                          contlor.changeLanguage("fa");
                          setState(() {
                            colo = 3;
                          });
                        },
                        color: (colo == 3) ? GFColors.DANGER : GFColors.PRIMARY,
                        text: "5".tr),
                  ],
                )
              ],
            )
          ],
        ),
      ),
      body: pages[page]
      
      
      
    );
  }
}
