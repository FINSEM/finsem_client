import 'package:finsem_client/controller/api.dart';
import 'package:finsem_client/model/cook_model.dart';
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

  static final Rx<FirebaseUser> _loggedInUser = FirebaseUser(
    name: '',
    add: '',
    email: '',
    bio: '',
    uid: '',
  ).obs;
  static Rx<FirebaseUser> get loggedInUser => _loggedInUser;

  static Future<void> init() async {
    var user = await Api.fetchUser(FirebaseAuth.instance.currentUser!.uid);
    _loggedInUser.value = FirebaseUser.fromFirebase(user);
  }

  static Future<List<Cook>> fetchCook() async {
    RxList<Cook> cook = <Cook>[].obs;
    var cookSnap = await Api.fetchCook();
    for (var element in cookSnap) {
      cook.add(Cook.fromMap(element.data()!));
    }
    return cook;
  }
}
