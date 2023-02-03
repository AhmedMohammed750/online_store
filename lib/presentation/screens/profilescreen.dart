import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:online_store_app/data/firebase.dart';

import 'package:sizer/sizer.dart';

class Profile1 extends StatefulWidget {
   const Profile1({super.key});

  @override
  State<Profile1> createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {

 final dat=DateTime.parse('${user1?.metadata.creationTime}');

  @override
  void initState() {
 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 2, 32, 56),
        centerTitle: true,title:Text('6'.tr,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold),)),
      body: Column(
     crossAxisAlignment: CrossAxisAlignment.center,
       
      children: [
        Container(
          color: Colors.blue[200],
          child: Center(
            child: GFAvatar(maxRadius: 100,
              backgroundImage:NetworkImage(
              "${user?.photoURL}"),)
          ),
        ),
        Divider(color: const Color.fromARGB(255, 2, 32, 56),thickness: 1.h,),
        ListView( scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            ListTile(title: Text('14'.tr,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
            subtitle: Text('${user?.displayName}',style: TextStyle(fontSize: 15.sp),),

            ),
                        ListTile(title: Text('15'.tr,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
            subtitle: Text('${dat.year} - ${dat.month} - ${dat.day}',style: TextStyle(fontSize: 15.sp),),

            ),
                        ListTile(title: Text('16'.tr,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
            subtitle: Text('${user?.email}',style: TextStyle(fontSize: 15.sp),),

            ),
                        ListTile(title: Text('17'.tr,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
            subtitle: Text('${user?.emailVerified}',style: TextStyle(fontSize: 15.sp),),

            ),

          ],
        )


      ],
    )
   

    );
  }
}
var user1=FirebaseAuth.instance.currentUser;