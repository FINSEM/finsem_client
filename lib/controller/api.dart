import 'package:cloud_firestore/cloud_firestore.dart';

class API {
  static final API api = API();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<DocumentSnapshot<Map<String, dynamic>>>> fetchEvents() async {
    var eventsSnap = await _db
        .collection('Organizations')
        .doc('OU7N0lCaWVxbYssLmM19')
        .collection('Events')
        .get();
    eventsSnap.docs;
    return eventsSnap.docs;
  }
}
