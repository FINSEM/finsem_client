import 'package:finsem_client/model/event_model.dart';
import 'api.dart';

class ApiController {
  final API _api = API();
  static final ApiController apiController = ApiController();
  Future<List<Event>> fetchEvents() async {
    List<Event> events = [];
    var eventSnap = await _api.fetchEvents();
    eventSnap.forEach((element) => events.add(Event.fromMap(element.data()!)));
    return events;
  }
}
