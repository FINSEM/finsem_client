class Cook {
  String name;
  num age;
  String mobile;
  bool veg;
  Cook({
    required this.name,
    required this.age,
    required this.mobile,
    required this.veg,
  });
  factory Cook.fromMap(Map<String, dynamic> cookSnap) {
    return Cook(
      name: cookSnap['name'],
      age: cookSnap['age'],
      mobile: cookSnap['mobile'],
      veg: cookSnap['veg'],
    );
  }
}
