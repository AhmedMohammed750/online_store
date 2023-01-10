// Packages

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
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
  Stripe.publishableKey='pk_test_51MNZu1BwVsCcYwRb2GcKZmU7WjQ8dothDte9gOuJeaGbxfsHkW4LKChORLzYHpX3pppEW7MXgbNwYMoyk1Ji5qMM00OIJojFPi';
  

   
  

  if (user==null) {
    islogin=false;
    
  }
  else{
    islogin=true;
  }

 
  runApp(const OnlineStoreApp() );
}
