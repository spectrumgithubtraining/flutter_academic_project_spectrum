import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FetchBookController extends GetxController {
  Future<List<QueryDocumentSnapshot<Object?>>> fetchBookDetails() async {
    final QuerySnapshot categoryData =
        await FirebaseFirestore.instance.collection('books').get();
    return categoryData.docs;
  }
}
