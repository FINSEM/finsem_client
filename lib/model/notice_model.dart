class Notice {
  final String title;
  final String description;
  final String imageLink;

  Notice({
    required this.title,
    required this.description,
    required this.imageLink,
  });
  factory Notice.fromMap(Map<String, dynamic> noticeSnap) {
    return Notice(
      title: noticeSnap['name'],
      description: noticeSnap['desc'],
      imageLink: noticeSnap['img'],
    );
  }
}
