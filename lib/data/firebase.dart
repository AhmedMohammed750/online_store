

import 'package:firebase_auth/firebase_auth.dart';


bool? islogin;
var user=FirebaseAuth.instance.currentUser;
var created=user?.email;
  

