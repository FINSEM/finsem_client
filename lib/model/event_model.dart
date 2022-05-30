class Event {
  final String title;
  final String description;
  final String location;
  final String date;
  final String time;
  final String imageLink;
  final bool donation;
  final num amountReq;

  Event(
      {required this.title,
      required this.description,
      required this.imageLink,
      required this.location,
      required this.date,
      required this.time,
      required this.donation,
      this.amountReq = 0});
  factory Event.fromMap(Map<String, dynamic> eventSnap) {
    return Event(
      title: eventSnap['name'],
      description: eventSnap['desc'],
      location: eventSnap['location'],
      date: eventSnap['date'],
      time: eventSnap['time'],
      imageLink: eventSnap['img'],
      donation: eventSnap['donation'],
      amountReq: eventSnap['amountReq'] ?? 0,
    );
  }
}
