// Packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_store_app/presentation/screens/welcome/verif.dart';

// Online Store App
import 'online_store_app.dart';


// ignore: public_member_api_docs


Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

 
  runApp(const OnlineStoreApp() );
}
