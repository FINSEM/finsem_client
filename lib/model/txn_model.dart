class Txn {
  final String id;
  final String desc;
  final String type;
  final String date;

  final String time;
  final String pyMode;

  Txn({
    required this.id,
    required this.desc,
    required this.type,
    required this.date,
    required this.time,
    required this.pyMode,
  });
}
