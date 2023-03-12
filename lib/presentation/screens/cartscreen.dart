




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';


import 'package:http/http.dart' as http;

import 'dart:convert';


import 'package:sizer/sizer.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Map<String, dynamic>? paymentIntent;
  List users1 = [];
  String? id;
  CollectionReference userref =
      FirebaseFirestore.instance.collection('purchases');
  DocumentReference documentReference = FirebaseFirestore.instance.collection('purchases').doc(); 
  
    var  send=false;

  getdate() async {
    
    try {
      await userref.get().then((value) => {
            // ignore: avoid_function_literals_in_foreach_calls
            value.docs.forEach((element) {
              setState(() {
                
                 users1.add(element.data());
                 
                
              });
              
             

             
              
             
            }
             
             
            ),
          });
          

      // ignore: empty_catches
    } catch (e) {}
  }

  resut() {
    int result = 0;
    for (var i = 0; i < users1.length; i++) {
      try{
      result = result + int.parse(users1[i]['price']);
      // ignore: empty_catches
      }catch(e){}
    }
    return result;
  }

 delet(name) async {
    //await FirebaseFirestore.instance.collection('favorite').doc(id).delete();

    
final collection = FirebaseFirestore.instance.collection('purchases');
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
      body: Column(
        children: [
          Expanded(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  // ignore: sized_box_for_whitespace
                  return Container(
                      height: 24.h,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            padding: const EdgeInsets.only( top: 50),
                            child: Column(
                              children: [
                                Text(
                                  '${users1[index]['name']}',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  '${users1[index]['price']} \$',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.red[900],
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 2.h,
                                )
                              ],
                            ),
                          ),

                          Row(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                     delet('${users1[index]['name']}');
                                      users1.removeAt(index);
                                      // ignore: avoid_print
                                      print(userref.id);
                                    });
                                  },
                                  icon: const Icon(Icons.cancel),
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
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              color: Colors.green[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        '12'.tr,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.red[900],
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' ${resut()}\$',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.red[900],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  TextButton.icon(
                    onPressed: () async{
                      showDialog(context: context, builder:(context){
                        return const Center(child: CircularProgressIndicator(),);
                      });
                      
                      await makePayment();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                      
                       
                     
                     
                    },
                    icon: Icon(
                      Icons.paypal_rounded,
                      size: 30.sp,
                      color: Colors.red,
                    ),
                    label: Text(
                      '13'.tr,
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent('10', 'USD'); 
      //Payment Sheet 
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
              // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
              style: ThemeMode.dark,
              merchantDisplayName: 'Adnan')).then((value){
      });


      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {

    try {
      await Stripe.instance.presentPaymentSheet(
          ).then((value){
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: const [
                    Icon(Icons.check_circle, color: Colors.green,),
                    Text("paid successfully"),
                  ];
                );
              ],
            ), 
          ));
        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("paid successfully")));

        paymentIntent = null;

      }).onError((error, stackTrace){
        print('Error is:--->$error $stackTrace');
      });


    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            content: Text("Cancelled "),
          ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          headers: {
            'Authorization': 'Bearer sk_test_51MNZu1BwVsCcYwRbL3xIZwIgjYsYeESYdy8raBb3sIcBLV93jpvtBLrPRpTQju74emT7pN8kbcfHl5vytEqSRJc6008L2tsPwv',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          body: body,
          );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100 ;
    return calculatedAmout.toString();
  }


}


//'Bearer sk_test_51MNZu1BwVsCcYwRbL3xIZwIgjYsYeESYdy8raBb3sIcBLV93jpvtBLrPRpTQju74emT7pN8kbcfHl5vytEqSRJc6008L2tsPwv',