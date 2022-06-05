import 'package:finsem_client/controller/api.dart';
import 'package:finsem_client/model/housekeeping_model.dart';
import 'package:finsem_client/model/event_model.dart';
import 'package:finsem_client/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ApiHelper extends GetxController {
  static final List<Event> _events = [];
  static List<Event> get events => _events;

  static Future<List<Event>> fetchEvents() async {
    var eventSnap = await Api.fetchEvents();
    for (var element in eventSnap) {
      _events.add(Event.fromMap(element.data()!));
    }
    return _events;
  }

  static Future<List<Event>> fetchNotices() async {
    var noticeSnap = await Api.fetchNotices();
    for (var element in noticeSnap) {
      _events.add(Event.fromMap(element.data()!));
    }
    return _events;
  }

  static final Rx<FirebaseUser> _loggedInUser = FirebaseUser(
    name: '',
    add: '',
    email: '',
    bio: '',
    uid: '',
    org: Organization(name: '', pending: 0, monthly: 0, oID: ''),
  ).obs;
  static Rx<FirebaseUser> get loggedInUser => _loggedInUser;

  static Future<void> init() async {
    var user = await Api.fetchUser(FirebaseAuth.instance.currentUser!.uid);
    _loggedInUser.value = FirebaseUser.fromFirebase(user);
  }

  static Future<List<HouseKeeping>> fetchHousekeeping() async {
    RxList<HouseKeeping> hk = <HouseKeeping>[].obs;
    var hkSnap = await Api.fetchHouseKeeping();
    for (var element in hkSnap) {
      hk.add(HouseKeeping.fromMap(element.data()!));
    }
    return hk;
  }
}
