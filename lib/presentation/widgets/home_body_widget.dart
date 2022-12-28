// Packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../data/firebase.dart';

class HomeBodyWidget extends StatefulWidget {
  HomeBodyWidget({
    Key? key,
    required this.imgList,
  }) : super(key: key);

  final List<String> imgList;

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  List users1 = [];

  getdate() async {
    CollectionReference userref =
        FirebaseFirestore.instance.collection('prodects');
    await userref.where('price').get().then((value) => {
          value.docs.forEach((element) {
            setState(() {
              users1.add(element.data());
            });
          })
        });
    print(users1);
  }

  @override
  void initState() {
    getdate();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
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
              items: widget.imgList
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
                          child: SizedBox.fromSize(size: Size.fromRadius(20.w),
                          child: Container(color:Colors.blue,
                            child: Image.network(
                              '${users1[i]['image']}',
                              fit: BoxFit.cover,
                              height: 40.h,
                              width: 45.w,
                             
                             
                              
                            ),
                          ),

                          )
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
                              textAlign: TextAlign.start,
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
