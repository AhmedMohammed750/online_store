// Packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:online_store_app/presentation/screens/productdec.dart';

import 'package:sizer/sizer.dart';

class HomeBodyWidget extends StatefulWidget {


  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  List users1 = [];
    final List<String> imgList = [
    'https://firebasestorage.googleapis.com/v0/b/online-store-50ede.appspot.com/o/image%20orginal%2Fdownload.jpg?alt=media&token=74e51892-3b94-4994-b650-4366fd411f40',
    'https://firebasestorage.googleapis.com/v0/b/online-store-50ede.appspot.com/o/image%20orginal%2F2.jpg?alt=media&token=373d4dfb-5ce7-4dab-8ea9-1612b5d27cbb',
    'https://firebasestorage.googleapis.com/v0/b/online-store-50ede.appspot.com/o/image%20orginal%2F3.jpg?alt=media&token=276d0c30-04c0-4e44-b83b-5ee6cdb62a77',
  ];

  getdate() async {
    try {
      
       CollectionReference userref =
        FirebaseFirestore.instance.collection('prodects');
    await userref.get().then((value) => {
      
          // ignore: avoid_function_literals_in_foreach_calls
          value.docs.forEach((element) {
            setState(() {
              users1.add(element.data());
            });
          })
        });
    
      
    // ignore: empty_catches
    } catch (e) {
      
    }
   
  }

  @override
  void initState() {
     
    getdate();
    

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
            width: 100.w,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imgList
                  // ignore: avoid_unnecessary_containers
                  .map((item) => Container(
                        child: Container(
                          margin: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Image.network(
                                    item,
                                    fit: BoxFit.fitWidth,
                                    width: double.infinity,
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
                                            Color.fromARGB(200, 0, 0, 0),
                                            Color.fromARGB(0, 0, 0, 0),
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 20.0,
                                      ),
                                      child: Text(
                                        '10'.tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ))
                  .toList(),
            ),
          ),
          SingleChildScrollView(
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                               Productdec(users1[i])),
                                            
                                    );
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
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 10.0,
                            ),
                            child: Text(
                              '${users1[i]['price']} \$',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.red[900],
                                fontSize: 10.sp,
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
          )
        ],
      ),
    );
  }
}
