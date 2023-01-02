import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Productdec extends StatelessWidget {
  final user;
  Productdec(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user['name']}'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              '${user['image']}',
              width: double.infinity,
              height: 50.h,
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              'name:\n${user['name']}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
            ),
            SizedBox(height: 2.h,),
            Divider(indent: 30.h,thickness: 1.h,
              height: 1.h,
              color: Colors.blue,
            ),
            SizedBox(height: 1.h,),
             Divider(indent: 15.h,thickness: 1.h,
              height: 1.h,
              color: Colors.blue,
            ),
            SizedBox(height: 1.h,),
             Divider(indent: 0.h,thickness: 1.h,
              height: 1.h,
              color: Colors.blue,
            ),
            SizedBox(height: 2.h,),
            Text('Description',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
            Text('${user['description']}'),
                        SizedBox(height: 2.h,),
            Divider(indent: 0.h,thickness: 1.h,
              height: 1.h,
              color: Colors.blue,
            ),
            SizedBox(height: 1.h,),
             Divider(indent: 15.h,thickness: 1.h,
              height: 1.h,
              color: Colors.blue,
            ),
            SizedBox(height: 1.h,),
             Divider(indent: 30.h,thickness: 1.h,
              height: 1.h,
              color: Colors.blue,
            ),
             SizedBox(height: 1.h,),
            Table(
              border: TableBorder.all(),
            children: [
              TableRow(
                children: [
                  Text('category',style: TextStyle(fontSize: 15.sp,backgroundColor: Colors.blue),),
                  Text('${user['category']}',style: TextStyle(fontSize: 15.sp),)
                  
                ]
              ),
                            TableRow(
                children: [
                  Text('Price',style: TextStyle(fontSize: 15.sp,backgroundColor: Colors.blue),),
                  Text('${user['price']} \$',style: TextStyle(fontSize: 13.sp,color: Colors.red))
                  
                ]
              )
            ],
            
            
            ),
            SizedBox(height:5.h ,)

          ],
        ),
      ),
    );
  }
}
