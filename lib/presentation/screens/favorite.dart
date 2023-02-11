

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  List users1 = [];
  CollectionReference userref =
      FirebaseFirestore.instance.collection('favorite');
  int page = 0;
  delet(name) async {
    //await FirebaseFirestore.instance.collection('favorite').doc(id).delete();

    
final collection = FirebaseFirestore.instance.collection('favorite');
      final snapshot =
          await collection.where('name', isEqualTo:name).get();
      for (var doc in snapshot.docs) {
       
 

        await doc.reference.delete();
      }
  }



  

  getdate() async {
    try {
      await userref.get().then((value) => {
            // ignore: avoid_function_literals_in_foreach_calls
            value.docs.forEach((element) {
              setState(() {
                users1.add(element.data());
                
              });
            }),

          
             
             
          });

      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  void initState() {
    getdate();
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text(
          'Favorite',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  // ignore: sized_box_for_whitespace
                  return Container(
                      height: 24.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // ignore: sized_box_for_whitespace
                          Container(
                              height: 20.h,
                              width: 30.w,
                              child: Image.network(
                                '${users1[index]['image']}',
                                fit: BoxFit.fill,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Column(
                              children: [
                                Text(
                                  '${users1[index]['name']}',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),

                          Row(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: () async{
                                   String id=users1[index]['name'];
                                   

                                    delet(id);
                                    setState(() {
      

                                      users1.removeAt(index);
                                      
                                    });
                                  },
                                  icon: Icon(Icons.cancel),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ));
                }),
                itemCount: users1.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 2.h,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
