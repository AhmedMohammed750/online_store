// Packages

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_store_app/data/firebase.dart';



// Online Store App
import 'online_store_app.dart';


// ignore: public_member_api_docs
bool darkMode = false;

Future <void> main() async{
  await GetStorage.init();
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
