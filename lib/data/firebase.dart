
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


bool? islogin;
var user=FirebaseAuth.instance.currentUser;
var created=user?.email;
  

