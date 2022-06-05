import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUser {
  final String name;
  final String bio;
  final String email;
  final String uid;
  final String add;
  num totalPending;
  final Organization org;

  FirebaseUser({
    required this.name,
    required this.email,
    required this.add,
    required this.bio,
    required this.uid,
    required this.totalPending,
    required this.org,
  });

  factory FirebaseUser.fromFirebase(
      DocumentSnapshot<Map<String, dynamic>> user) {
    return FirebaseUser(
      name: user.data()!['name'],
      email: user.data()!['email'],
      add: user.data()!['block'],
      bio: user.data()!['bio'],
      totalPending: user.data()!['total_pending'],
      uid: user.id,
      org: Organization.fromFirebase(user.data()!['org']),
    );
  }
}

class Organization {
  final String name;
  final num monthly;
  final String oID;
  final num pending;
  Organization(
      {required this.name,
      required this.monthly,
      required this.oID,
      required this.pending});

  factory Organization.fromFirebase(Map<String, dynamic> org) {
    return Organization(
      name: org['name'],
      monthly: org['monthly'],
      oID: org['OID'],
      pending: org['pending'],
    );
  }
}
