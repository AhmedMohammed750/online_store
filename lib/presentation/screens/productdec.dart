import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

class Productdec extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final user;
  // ignore: use_key_in_widget_constructors
  const Productdec(this.user);

  @override
  State<Productdec> createState() => _ProductdecState();
}

class _ProductdecState extends State<Productdec> {
  addprod() {
    // ignore: non_constant_identifier_names
    Map<String, String> DatatoSave = {
      'name': widget.user['name'],
      'price': widget.user['price'],
      'image': widget.user['image'],
      'id': ''
    };
    FirebaseFirestore.instance.collection('purchases').add(DatatoSave);

    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.success,
      body: const Center(
        child: Text(
          'Has been added to cart',
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
        title: Text('${widget.user['name']}'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                '${widget.user['image']}',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 50.h,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              'Name:\n${widget.user['name']}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            Divider(
              indent: 30.h,
              thickness: 1.h,
              height: 1.h,
              color: Colors.blue,
            ),
            SizedBox(
              height: 1.h,
            ),
            Divider(
              indent: 15.h,
              thickness: 1.h,
              height: 1.h,
              color: Colors.blue,
            ),
            SizedBox(
              height: 1.h,
            ),
            Divider(
              indent: 0.h,
              thickness: 1.h,
              height: 1.h,
              color: Colors.blue,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              '28'.tr,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            Text('${widget.user['description']}'),
            SizedBox(
              height: 2.h,
            ),
            Divider(
              indent: 0.h,
              thickness: 1.h,
              height: 1.h,
              color: Colors.blue,
            ),
            SizedBox(
              height: 1.h,
            ),
            Divider(
              indent: 15.h,
              thickness: 1.h,
              height: 1.h,
              color: Colors.blue,
            ),
            SizedBox(
              height: 1.h,
            ),
            Divider(
              indent: 30.h,
              thickness: 1.h,
              height: 1.h,
              color: Colors.blue,
            ),
            SizedBox(
              height: 1.h,
            ),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '26'.tr,
                      style: TextStyle(
                          fontSize: 15.sp, backgroundColor: Colors.blue),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${widget.user['category']}',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  )
                ]),
                TableRow(children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '27'.tr,
                      style: TextStyle(
                          fontSize: 15.sp, backgroundColor: Colors.blue),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text('${widget.user['price']} \$',
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.red,
                            fontWeight: FontWeight.bold)),
                  )
                ]),
                TableRow(children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '30'.tr,
                      style: TextStyle(
                          fontSize: 15.sp, backgroundColor: Colors.blue),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${widget.user['count']}',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  )
                ]),
              ],
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white),
              onPressed: () {
                if (int.parse(widget.user['count']) > 0) {
                  addprod();
                } else {
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.rightSlide,
                    dialogType: DialogType.error,
                    body: const Center(
                      child: Text(
                        "Sorry, currently unavailable try another time.",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    title: 'Erorr Email',
                    btnOkOnPress: () {},
                  ).show();
                }
              },
              icon: const Icon(Icons.shopping_cart),
              label: Text('22'.tr),
            ),
            SizedBox(
              height: 5.h,
            )
          ],
        ),
      ),
    );
  }
}
