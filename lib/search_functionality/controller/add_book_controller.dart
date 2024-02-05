import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../model/booksmodel.dart';

class AddBookController extends GetxController {
  Future<void> addBooks(String bookName, String authorName,
      String publishedDate, String description, BuildContext context) async {
    try {
      BooksModel newBook = BooksModel(
        bookName: bookName,
        authorName: authorName,
        publishedDate: publishedDate,
        description: description,
      );
      try {
        await FirebaseFirestore.instance
            .collection('books')
            .add(newBook.toJson());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('BOOK added success.'),
            duration: Duration(seconds: 2), // Adjust the duration as needed
          ),
        );

        Navigator.of(context).pop();
      } catch (e) {
        print('Error adding book: $e');
      }
    } catch (e) {
      // Show Snackbar on failure
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Error,Failed to add the book. Please try again later.'),
          duration: Duration(seconds: 2), // Adjust the duration as needed
        ),
      );
    }
  }
}
