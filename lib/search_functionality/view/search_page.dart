import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_academic_project_spectrum/search_functionality/view/home.dart';
import 'package:get/get.dart';

import '../controller/search_book_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchBookController _controller = Get.put(SearchBookController());
  final _searchBook = TextEditingController();

  late Stream<QuerySnapshot> _searchStream;

  @override
  void initState() {
    super.initState();
    // Initialize the stream in initState
    _searchStream = _controller.getBookStream('');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Get.to(const HomePage());
            },
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [
            Container(
              color: Colors.white,
              width: Get.width * 0.70,
              child: TextFormField(
                controller: _searchBook,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  // Update the stream based on the current query
                  _searchStream =
                      _controller.getBookStream(_searchBook.text.trim());
                });
              },
              icon: Icon(Icons.search),
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: _searchStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else if (!snapshot.hasData ||
                          (snapshot.data as QuerySnapshot).docs.isEmpty) {
                        return Center(
                          child: Text('No results found'),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            var book = snapshot.data!.docs[index];
                            // Display book information in your ListTile or other widget
                            return ListTile(
                              title: Text(book['bookName']),
                              // Add more widgets for other information
                            );
                          },
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
