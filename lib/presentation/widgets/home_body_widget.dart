// Packages
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/position/gf_position.dart';
import 'package:sizer/sizer.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({
    Key? key,
    required this.imgList,
  }) : super(key: key);

  final List<String> imgList;

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
                          Image.asset(
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
          GFCard(
            boxFit: BoxFit.contain,
            titlePosition: GFPosition.start,
            showOverlayImage: true,
            imageOverlay: const AssetImage(
              'assets/7.webp',
            ),
            title: GFListTile(
              titleText: 'MSI Gaming laptop',
              subTitleText: 'price: 1200 \$',
              icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Color.fromARGB(255, 2, 32, 56),
                  )),
            ),
          ),
          GFCard(
            boxFit: BoxFit.contain,
            titlePosition: GFPosition.end,
            showOverlayImage: true,
            showImage: true,
            imageOverlay: const AssetImage(
              'assets/5.webp',
            ),
            title: GFListTile(
              titleText: 'logitech mouse',
              subTitleText: 'price: 35 \$',
              icon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Color.fromARGB(255, 2, 32, 56),
                ),
              ),
            ),
          ),
          GFCard(
            boxFit: BoxFit.contain,
            titlePosition: GFPosition.end,
            showOverlayImage: true,
            imageOverlay: const AssetImage(
              'assets/4.jpg',
            ),
            title: GFListTile(
              titleText: 'Iphone 14 pro max',
              subTitleText: 'price: 1500 \$',
              
              icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Color.fromARGB(255, 2, 32, 56),
                  )),
            ),
          ),
          const GFCard(
            boxFit: BoxFit.contain,
            titlePosition: GFPosition.end,
            showOverlayImage: true,
           
            imageOverlay: AssetImage(
              'assets/6.jpg',
            ),
            title: GFListTile(
              titleText: 'logitech mouse',
              subTitleText: 'price: 7 IQD',
              
              
            ),
          ),
        ],
      ),
    );
  }
}