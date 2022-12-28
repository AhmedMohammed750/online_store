import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:file_picker/file_picker.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue[100],
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Name of the product:',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    maxLength: 10,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                      border: OutlineInputBorder(),
                      hintText: "Laptop ",
                      hintStyle: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (String? value) {
                      try {
                        if (value!.isEmpty) {
                          return 'must not be empty';
                        }
                        return null;
                      } catch (e) {}
                    },
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    'Description of product',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    minLines: 7,
                    maxLines: null,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.description_sharp,
                        color: Colors.blue,
                      ),
                      border: OutlineInputBorder(),
                      hintText:
                          "touch pad \nGeneration \nnetwork interface card \nCD-RAM ",
                      hintStyle: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (String? value) {
                      try {
                        if (value!.isEmpty) {
                          return ' must not be empty';
                        }
                        return null;
                      } catch (e) {}
                    },
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    'Product Condition: ',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    maxLength: 10,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.fiber_new,
                        color: Colors.blue,
                      ),
                      border: OutlineInputBorder(),
                      hintText: "New",
                      hintStyle: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (String? value) {
                      try {
                        if (value!.isEmpty) {
                          return ' must not be empty';
                        }
                        return null;
                      } catch (e) {}
                    },
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        final result = await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            type: FileType.custom,
                            allowedExtensions: [
                              'png',
                              'jpg',
                             
                            ]);
                        if (result == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('No file selected')));
                              return null;
                        }
                        final Path=result.files.single.path;
                        final pathname=result.files.single.name;
                        print(Path);
                        print(pathname);
                      },
                      child: Text('Upload Image')),
                  SizedBox(
                    height: 4.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.h),
                    child: Container(
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: SizedBox(
                          height: 10.h,
                          child: TextButton(
                            onPressed: () async {},
                            child: const Text(
                              "Add Product",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
