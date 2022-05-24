import 'package:cloud_firestore/cloud_firestore.dart';

class Api {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static Future<List<DocumentSnapshot<Map<String, dynamic>>>>
      fetchEvents() async {
    var eventsSnap = await _db
        .collection('Organizations')
        .doc('tw2TPyM4WQgbLJ3w4hxAfGnc9JE2')
        .collection('Events')
        .get();
    eventsSnap.docs;
    return eventsSnap.docs;
  }

  static Future<List<DocumentSnapshot<Map<String, dynamic>>>>
      fetchCook() async {
    var cookSnap = await _db
        .collection('Organizations')
        .doc('tw2TPyM4WQgbLJ3w4hxAfGnc9JE2')
        .collection('Cook')
        .get();
    cookSnap.docs;
    return cookSnap.docs;
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> fetchUser(
      String uid) async {
    var userSnap = await _db.collection('Users').doc(uid).get();
    return userSnap;
  }
}
