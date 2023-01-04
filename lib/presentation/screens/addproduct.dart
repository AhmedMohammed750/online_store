
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';

import 'package:sizer/sizer.dart';


class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  final TextEditingController nameproduct = TextEditingController();
  final TextEditingController descriptionproduct = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController Conditionproduct = TextEditingController();
    final TextEditingController price = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  String imageurl='';
  check()async{
    
    var formke=_formKey.currentState;
    if (formke!.validate()) {
      formke.save();
      Map<String,String> DataToSave={
       'name':nameproduct.text,
       'description':descriptionproduct.text,
       'price':price.text,
       'image':imageurl
       
     };
      FirebaseFirestore.instance.collection('prodects').add(DataToSave);
    }
              
              AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.info,
           
            body: const Center(
              child: Text(
                'Has been added',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            title: 'Erorr Email',
            btnOkOnPress: () {},
          ).show();

  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue[100],
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Name of the product:',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    controller: nameproduct,
                    maxLength: 10,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                      border: OutlineInputBorder(),
                      hintText: "Laptop ",
                      hintStyle: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (String? value) {
                      try {
                        if (value!.isEmpty) {
                          return 'must not be empty';
                        }
                        return null;
                      } catch (e) {}
                    },
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    'Description of product',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    controller: descriptionproduct,
                    minLines: 7,
                    maxLines: null,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.description_sharp,
                        color: Colors.blue,
                      ),
                      border: OutlineInputBorder(),
                      hintText:
                          "touch pad \nGeneration \nnetwork interface card \nCD-RAM ",
                      hintStyle: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (String? value) {
                      try {
                        if (value!.isEmpty) {
                          return ' must not be empty';
                        }
                        return null;
                      } catch (e) {}
                    },
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    'Product Condition: ',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    controller: Conditionproduct,
                    maxLength: 10,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.fiber_new,
                        color: Colors.blue,
                      ),
                      border: OutlineInputBorder(),
                      hintText: "New",
                      hintStyle: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (String? value) {
                      try {
                        if (value!.isEmpty) {
                          return ' must not be empty';
                        }
                        return null;
                      } catch (e) {}
                    },
                  ),
                  
                  TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
                    child:const Text('Upload image',style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold),),
                    onPressed: ()async{
                      String uniquename=DateTime.now().millisecondsSinceEpoch.toString();
                     ImagePicker imagePicker=ImagePicker();
                     XFile? file=await imagePicker.pickImage(source: ImageSource.gallery);
                     print(file?.path);
                     if (file==null)return; 
                       
                     
                     //refrence
                     Reference referenceroRoot=FirebaseStorage.instance.ref();
                     Reference imagerefdir=referenceroRoot.child('image orginal/');
                     Reference referenceimageupload=imagerefdir.child(uniquename);
                     try {
                      await referenceimageupload.putFile(File(file!.path));
                       imageurl=await referenceimageupload.getDownloadURL();
                       print(imageurl);
                       
                     } catch (e) {
                       
                     }
                    




                  }, ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    controller: price,
                    maxLength: 10,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.price_change_rounded,
                        color: Colors.blue,
                      ),
                      border: OutlineInputBorder(),
                      hintText: "Price ",
                      hintStyle: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (String? value) {
                      try {
                        if (value!.isEmpty) {
                          return 'must not be empty';
                        }
                        return null;
                      } catch (e) {}
                    },
                  ),
                
                  SizedBox(
                    height: 4.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.h),
                    child: Container(
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: SizedBox(
                          height: 10.h,
                          child: TextButton(
                            onPressed: () async {
                              check();
                              
                            },
                            child: const Text(
                              "Add Product",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h,)
                ],
              ),
            )),
      ),
    );
  }
}
