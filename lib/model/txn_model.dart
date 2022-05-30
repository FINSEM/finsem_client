class Txn {
  final String id;
  final num amount;
  final String desc;
  final String type;
  final String date;
  final String paidBy;
  final String orgId;
  final String time;
  final String pyMode;

  Txn({
    required this.id,
    required this.amount,
    required this.desc,
    required this.paidBy,
    required this.orgId,
    required this.type,
    required this.date,
    required this.time,
    required this.pyMode,
  });
}
