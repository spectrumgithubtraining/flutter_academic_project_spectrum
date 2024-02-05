import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_academic_project_spectrum/search_functionality/view/search_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/fetch_book_controller.dart';
import '../model/booksmodel.dart';
import 'bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: BottomSheetContent(),
        );
      },
    );
  }

  final FetchBookController _fetchBookController =
      Get.put(FetchBookController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Get.to(() => const SearchPage());
                },
                child: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              _showBottomSheet(context);
            },
            label: Row(
              children: [Icon(Icons.add), Text("Add data")],
            )),
        body: Container(
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: _fetchBookController.fetchBookDetails(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      // Handle error
                      return Text('Error: ${snapshot.error}');
                    } else {
                      List<QueryDocumentSnapshot<Object?>> data =
                          snapshot.data!;
                      int dataLength = data.length;
                      return Expanded(
                        child: ListView.builder(
                          itemCount: dataLength,
                          itemBuilder: (context, index) {
                            final productData = data[index];
                            BooksModel book = BooksModel.fromJson(
                                productData.data() as Map<String, dynamic>);
                            return Card(
                              child: ListTile(
                                  title: Text(book.bookName),
                                  subtitle: Text(book.authorName)),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
