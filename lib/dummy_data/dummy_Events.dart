import 'package:get/get.dart';

class DummyData {
  RxList events = [
    Events(
      title: "Dussehra",
      description:
          "Vijayadashami (Sanskrit: विजयदशमी, romanized: Vijayadaśamī), also known as Dussehra, Dasara or Dashain, is a major Hindu festival celebrated at the end of Navaratri every year. It is observed on the tenth day in the Hindu calendar month of Ashvin, the seventh month of the Hindu Luni-Solar Calendar, which typically falls in the Gregorian months of September and October",
      imagePath: "assets/images/event_image.jpg",
      location: "Orion Mall",
      date: "12 October 2022",
      time: "10Am-2Pm",
    ),
    Events(
      title: "Diwali Celebration",
      description:
          " Diwali is a festival of lights and one of the major festivals celebrated by Hindus, Buddhists, Jains, and Sikhs. The festival usually lasts five days and is celebrated during the Hindu lunisolar month Kartika.",
      imagePath: "assets/images/event_image.jpg",
      location: "Compound",
      date: "13 November 2022",
      time: "6Pm-10Pm",
    ),
    Events(
      title: "Dussehra",
      description:
          "Vijayadashami (Sanskrit: विजयदशमी, romanized: Vijayadaśamī), also known as Dussehra, Dasara or Dashain, is a major Hindu festival celebrated at the end of Navaratri every year. It is observed on the tenth day in the Hindu calendar month of Ashvin, the seventh month of the Hindu Luni-Solar Calendar, which typically falls in the Gregorian months of September and October",
      imagePath: "assets/images/event_image.jpg",
      location: "Orion Mall",
      date: "12 October 2022",
      time: "10Am-2Pm",
    ),
  ].obs;
}

class Events {
  final String title;
  final String description;
  final String location;
  final String date;
  final String time;
  final String imagePath;

  Events(
      {required this.title,
      required this.description,
      required this.imagePath,
      required this.location,
      required this.date,
      required this.time});
}
