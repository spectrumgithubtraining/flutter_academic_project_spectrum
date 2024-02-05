import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SearchBookController extends GetxController {
  Stream<QuerySnapshot> getBookStream(String query) {
    if (query.isEmpty) {
      // Return an empty stream if the query is empty
      return Stream.empty();
    } else {
      return FirebaseFirestore.instance
          .collection('books')
          .where('bookName', isGreaterThanOrEqualTo: query)
          .where('bookName', isLessThan: query + 'z')
          .snapshots();
    }
  }
}
