import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



class Adiminpurchess extends StatefulWidget {
  @override
  State<Adiminpurchess> createState() => _AdiminpurchessState();
}

class _AdiminpurchessState extends State<Adiminpurchess> {
  List users1 = [];

  CollectionReference userref =
      FirebaseFirestore.instance.collection('purchess');
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
     delete(name) async {
    //await FirebaseFirestore.instance.collection('favorite').doc(id).delete();

    
final collection = FirebaseFirestore.instance.collection('purchess');
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
    return MaterialApp(
     debugShowMaterialGrid: false,
      home: Scaffold(
        appBar: AppBar(centerTitle: true,
          title: Text('List Of Purchases'),
        ),
        body: ListView.builder(
          itemCount: users1.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: const Icon(Icons.account_circle),
                  title: Text(
                    users1[index]['name'],
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    users1[index]['price']+'\$',
                    style: TextStyle(fontSize: 15.sp,color: Colors.red),
                  ),
                  trailing: IconButton( icon:const Icon(Icons.delete), onPressed: () {
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
                                            delete('${users1[index]['name']}');
                                            Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) =>  Adiminpurchess(),));


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





                    },),
               
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
