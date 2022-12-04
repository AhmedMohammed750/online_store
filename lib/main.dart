// Packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:online_store_app/data/firebase.dart';


// Online Store App
import 'online_store_app.dart';


// ignore: public_member_api_docs


Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
  

  if (user==null) {
    islogin=false;
    
  }
  else{
    islogin=true;
  }

 
  runApp(const OnlineStoreApp() );
}
