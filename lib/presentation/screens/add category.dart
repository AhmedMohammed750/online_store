
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Add_Category extends StatefulWidget {
  const Add_Category({super.key});

  @override
  State<Add_Category> createState() => _Add_CategoryState();
}

class _Add_CategoryState extends State<Add_Category> {
 final _formKey = GlobalKey<FormState>();
  final _categoryNameController = TextEditingController();

  void _addCategory() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance.collection('category').add({
          'category': _categoryNameController.text,
        });
         AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.success,
           
            body: const Center(
              child: Text(
                'Has been added to category',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            title: 'DONE',
            btnOkOnPress: () {},
          ).show();
       
      } catch (e) {
        print('Error adding category: $e');
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _categoryNameController,
                decoration: InputDecoration(
                  labelText: 'Category Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _addCategory,
                child: Text('Add Category'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}