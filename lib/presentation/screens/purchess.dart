
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Purches extends StatefulWidget {
  Purches({super.key});

  @override
  State<Purches> createState() => _PurchesState();
}

class _PurchesState extends State<Purches> {
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

  @override
  void initState() {
    getdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('9'.tr),
        centerTitle: true,
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: users1.length,
        itemBuilder: (BuildContext context, int index) {
          final data = users1[index];
          Divider(
            color: Color.fromARGB(255, 232, 5, 5),
            thickness: 1,
          );
          return ListTile(
            title: Text(data['name'],),
            subtitle: Text(
                '\n\n description:\n ${data['description']},\n\n  price:\n ${data['price']}\$'),
          );
        },
      ),
    );
  }
}
