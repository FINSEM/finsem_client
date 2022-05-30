class ServiceMan {
  String name;
  num age;
  String desc;
  String mobile;
  ServiceType hkType;
  bool veg;
  String gender;
  ServiceMan({
    required this.name,
    required this.age,
    required this.desc,
    required this.hkType,
    required this.mobile,
    required this.veg,
    required this.gender,
  });
  factory ServiceMan.fromMap(Map<String, dynamic> hkSnap) {
    return ServiceMan(
      name: hkSnap['name'],
      age: hkSnap['age'],
      desc: hkSnap['desc'],
      mobile: hkSnap['mobile'],
      hkType: hkSnap['serviceType'],
      veg: hkSnap['veg'],
      gender: hkSnap['gender'] ? 'M' : 'F',
    );
  }
}

enum ServiceType {
  plumber,
  carpenter,
  electrician,
  internet,
}
