import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class Deleteproduct extends StatefulWidget {
  const Deleteproduct({super.key});

  @override
  State<Deleteproduct> createState() => _DeleteproductState();
}

class _DeleteproductState extends State<Deleteproduct> {
  List users1 = [];
  getdate() async {
    try {
      CollectionReference userref =
          FirebaseFirestore.instance.collection('prodects');
      await userref.get().then((value) => {
            // ignore: avoid_function_literals_in_foreach_calls
            value
              // ignore: avoid_function_literals_in_foreach_calls
              ..docs.forEach((element) {
                setState(() {
                  users1.add(element.data());
                });
              })
          });

      // ignore: empty_catches
    } catch (e) {}
  }
   delete(name) async {
    //await FirebaseFirestore.instance.collection('favorite').doc(id).delete();

    
final collection = FirebaseFirestore.instance.collection('prodects');
      final snapshot =
          await collection.where('name', isEqualTo:name).get();
      for (var doc in snapshot.docs) {
       
 

        await doc.reference.delete();
      }
  }

 

  @override
  void initState() {
    getdate();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            shrinkWrap: true,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            children: List.generate(users1.length, (i) {
              return Center(
                  child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(20.w),
                        child: Container(
                          color: Colors.blue,
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Delete Item"),
                                    content: const Text(
                                        "Are you sure you want to delete this item?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, false),
                                        child: const Text("Cancel"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            delete('${users1[i]['name']}');
                                            Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => const Deleteproduct(),));


                                          });
                                        },
                                        child: const Text("Delete"),
                                      ),
                                    ],
                                  );
                                },
                               ).then((value) {
                                if (value == true) {
                                  // code to delete item goes here
                                }
                              });
                            },
                            child: Image.network(
                              '${users1[i]['image']}',
                              fit: BoxFit.cover,
                              height: 40.h,
                              width: 45.w,
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                    top: 0.0,
                    bottom: 100.0,
                    left: 10.0,
                    right: 100.0,
                    child: Container(
                        height: 5.h,
                        width: 5.w,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            // ignore: prefer_const_literals_to_create_immutables
                            colors: [
                              Color.fromARGB(100, 22, 44, 33),
                              Color.fromRGBO(24, 233, 111, 0.6)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 0,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {},
                        )),
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          // ignore: prefer_const_literals_to_create_immutables
                          colors: [
                            Color.fromARGB(255, 2, 32, 56),
                            Color.fromARGB(255, 2, 60, 56),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 10.0,
                      ),
                      child: Text(
                        '${users1[i]['name']}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ));
            }),
          ),
        ],
      ),
    ));
  }
}
