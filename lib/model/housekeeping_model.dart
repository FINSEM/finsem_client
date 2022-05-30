class HouseKeeping {
  String name;
  num age;
  String desc;
  String mobile;
  HkType hkType;
  bool veg;
  String gender;
  HouseKeeping({
    required this.name,
    required this.age,
    required this.desc,
    required this.hkType,
    required this.mobile,
    required this.veg,
    required this.gender,
  });
  factory HouseKeeping.fromMap(Map<String, dynamic> hkSnap) {
    return HouseKeeping(
      name: hkSnap['name'],
      age: hkSnap['age'],
      desc: hkSnap['desc'],
      mobile: hkSnap['mobile'],
      hkType: hkSnap['hkType'] == 'cook' ? HkType.cook : HkType.maid,
      veg: hkSnap['veg'],
      gender: hkSnap['gender'] ? 'M' : 'F',
    );
  }
}

enum HkType {
  maid,
  cook,
}
