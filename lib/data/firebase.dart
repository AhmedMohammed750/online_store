





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../presentation/widgets/search.dart';



bool? islogin;



var user=FirebaseAuth.instance.currentUser;
var created=user?.email;
  List users2=[];
   var name1=[];
   var name2=[];
    List users5 = [];
   
   


  CollectionReference userref =
      FirebaseFirestore.instance.collection('prodects');
  getdate1() async {
    
   
    try {
      await userref.get().then((value) =>
       value.docs.forEach((element) {
            users2.add(element.data());
          }));

      for (var i = 0; i < users2.length; i++) {
        name1.add(users2[i]['name']);

      }
   

      // ignore: empty_catches
    } catch (e) {}
  }
geterr(String res)async{
  users5=[];
      var resup=await userref.where('name',isEqualTo:res).get();
      resup.docs.forEach((element) {

        
          users5.add(element.data());
       

       });
      
       
      

    }
  