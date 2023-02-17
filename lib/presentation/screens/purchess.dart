


import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';



class Purches extends StatefulWidget {
  const Purches({super.key});

  @override
  State<Purches> createState() => _PurchesState();
}

class _PurchesState extends State<Purches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Purchases'),centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8.h,),
            Text('List of purchases',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
            SizedBox(height: 3.h,),
        Table(
        defaultColumnWidth: const FlexColumnWidth(1.0),
        border: TableBorder.all(),
        children: [
          TableRow(children: [
        TableCell(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: const Text("NAME:"),
          ),
        ),
        TableCell(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: const Text("DESCRIPTION"),
          ),
        ),
        TableCell(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: const Text("PAID"),
          ),
        ),
          ]),
          TableRow(children: [
        TableCell(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: const Text("BENGOO"),
          ),
        ),
        TableCell(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: const Text("BENGOO G9000 Stereo Gaming Headset for PS4 PC Xbox One PS5 Controller, Noise Cancelling Over Ear Headphones with Mic, LED Light, Bass Surround, Soft Memory Earmuffs for Laptop Mac Nintendo NES Games"),
          ),
        ),
        TableCell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: const Icon(Icons.done_all,color: Color.fromARGB(255, 8, 239, 16),),
              ),
            ],
          ),
        ),
          ]),
          TableRow(children: [
        TableCell(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: const Text("A52"),
          ),
        ),
        TableCell(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: const Text("Samsung Galaxy A52 gives you 6.5” Infinity-O display & super-smooth 90Hz. The versatile quad camera helps you to capture the world as you see it. Take amazing photos with the revolutionary 64MP OIS camera and experience improved gaming with the long-lasting battery and 25w super-fast charging. Protected by Gorilla Glass 5."),
          ),
        ),
        TableCell(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center
            ,
            children: const [
              
            
              Icon(Icons.done_all,color: Color.fromARGB(255, 8, 239, 16),),
            ],
          ),
        ),
          ]),
        ],
      )
      
      
        ]),
      ),
    );
  }
}




