class Notice {
  final String title;
  final String description;
  final String imageLink;

  Notice({
    required this.title,
    required this.description,
    required this.imageLink,
  });
  factory Notice.fromMap(Map<String, dynamic> eventSnap) {
    return Notice(
      title: eventSnap['name'],
      description: eventSnap['desc'],
      imageLink: eventSnap['img'],
    );
  }
}
