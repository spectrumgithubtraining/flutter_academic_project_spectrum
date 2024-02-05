import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/add_book_controller.dart';
import '../model/booksmodel.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({super.key});

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  final formKey = GlobalKey<FormState>();
  final _bookName = TextEditingController();
  final _authorName = TextEditingController();
  final _publishedDate = TextEditingController();
  final _description = TextEditingController();
  final AddBookController _addBookController = Get.put(AddBookController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Book Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _bookName,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Book Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the book name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _authorName,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Author Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the author name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _publishedDate,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(labelText: 'Published Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the published date';
                  }
                  // You can add additional date validation logic if needed
                  return null;
                },
              ),
              SizedBox(height: 8),
              TextFormField(
                maxLines: 3,
                controller: _description,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _submitForm(context);
                      // Navigator.pop(context);
                    },
                    child: Text('Save'),
                  ),
                  SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submitForm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      var name = _bookName.text.trim();
      print(name);
      _addBookController.addBooks(
          _bookName.text.trim(),
          _authorName.text.trim(),
          _publishedDate.text.trim(),
          _description.text.trim(),
          context);
    }
  }
}
