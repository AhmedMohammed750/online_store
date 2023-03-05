import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_store_app/presentation/screens/home_screen.dart';

import 'package:online_store_app/presentation/screens/productdec.dart';

import 'package:sizer/sizer.dart';

class Category extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final category;
  const Category(this.category, {super.key});

  @override
  State<Category> createState() => _CategoryState();
}

List users1 = [];

class _CategoryState extends State<Category> {
  getdate() async {
      
    try {
      CollectionReference userref =
          FirebaseFirestore.instance.collection('prodects');
      await userref
          .where('category', isEqualTo: widget.category)
          .get()
          .then((value) => {
                // ignore: avoid_function_literals_in_foreach_calls
                value.docs.forEach((element) {
                  setState(() {
                    users1.add(element.data());

                    
                  });
                })
              });
            
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  void initState() {
    users1 = [];

    getdate();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 2, 32, 56),
        actions: [
          IconButton(
              onPressed: () {
                users1 = [];
                Navigator.push(context,MaterialPageRoute(builder:(context) =>const HomeScreen(),));
              },
              icon: const Icon(Icons.close))
        ],
        title: Text('${widget.category}',),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
      ),
    );
  }
}
