import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finsem_client/controller/api_helper.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:developer' as debug;
import 'package:path/path.dart' as path;
import 'dart:math';

class Api {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static Future<DocumentSnapshot<Map<String, dynamic>>> fetchUser(
      String uid) async {
    var userSnap = await _db.collection('Users').doc(uid).get();
    return userSnap;
  }

  static Future<List<DocumentSnapshot<Map<String, dynamic>>>>
      fetchEvents() async {
    var eventsSnap = await _db
        .collection('Organizations')
        .doc(ApiHelper.loggedInUser.value.org.oID)
        .collection('Events')
        .get();
    eventsSnap.docs;
    return eventsSnap.docs;
  }

  static Future<List<DocumentSnapshot<Map<String, dynamic>>>>
      fetchDonation() async {
    var donationsSnap = await _db
        .collection('Organizations')
        .doc(ApiHelper.loggedInUser.value.org.oID)
        .collection('Events')
        .where('donation', isEqualTo: true)
        .get();
    donationsSnap.docs;
    return donationsSnap.docs;
  }

  static Future<List<DocumentSnapshot<Map<String, dynamic>>>>
      fetchNotices() async {
    var noticeSnap = await _db
        .collection('Organizations')
        .doc(ApiHelper.loggedInUser.value.org.oID)
        .collection('Notices')
        .get();
    noticeSnap.docs;
    return noticeSnap.docs;
  }

  static Future<List<DocumentSnapshot<Map<String, dynamic>>>>
      fetchHouseKeeping() async {
    var hkSnap = await _db
        .collection('Organizations')
        .doc(ApiHelper.loggedInUser.value.org.oID)
        .collection('Housekeeping')
        .get();
    return hkSnap.docs;
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchServices() {
    var serviceSnap = _db
        .collection('Organizations')
        .doc('tw2TPyM4WQgbLJ3w4hxAfGnc9JE2')
        .collection('Services')
        .snapshots();
    return serviceSnap;
  }

  static Future<String> uploadImageToFirebase(File image) async {
    String finalURL = '';
    String fileName = path.basename(image.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('Issues/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(File(image.path));
    TaskSnapshot taskSnapshot = await uploadTask;
    finalURL = await taskSnapshot.ref.getDownloadURL();
    return finalURL;
  }

  static Future uploadIssue(String issueType, String desc, File image) async {
    Random _random = Random();
    final uploadedImageURL = await uploadImageToFirebase(image);
    DocumentReference dr =
        FirebaseFirestore.instance.collection('Issues').doc();
    debug.log(uploadedImageURL);
    // await dr.update({
    //   'feed_image_url': uploadedImageURL,
    // });
    await dr.set({
      "orgUid": ApiHelper.loggedInUser.value.org.oID,
      "userUid": ApiHelper.loggedInUser.value.uid,
      "tBlockRoom": ApiHelper.loggedInUser.value.add,
      "tType": issueType,
      "tDesc": desc,
      "tImg": uploadedImageURL,
      "tstatus": "Under proccess",
      "tID": "TK${_random.nextInt(10000)}",
      "creationTime": DateTime.now().millisecondsSinceEpoch,
    });
  }

  static Future uploadTxn(String paymentType, String desc, num amount) async {
    Random _random = Random();
    DocumentReference dr =
        FirebaseFirestore.instance.collection('Transaction').doc();

    await dr.set({
      "orgUid": ApiHelper.loggedInUser.value.org.oID,
      "userUid": ApiHelper.loggedInUser.value.uid,
      "tBlockRoom": ApiHelper.loggedInUser.value.add,
      "pType": paymentType,
      "amount": amount,
      "tDesc": desc,
      "time": DateTime.now().millisecondsSinceEpoch,
      "tID": "TNX${_random.nextInt(1000000000)}",
    });
  }
}
