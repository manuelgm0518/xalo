import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final DateTime creation;
  final String type;
  final String email;
  final String password;
  final int level;

  User({
    this.id,
    this.creation,
    this.type,
    this.email,
    this.password,
    this.level,
  });

  User copyWith({
    String id,
    DateTime creation,
    String type,
    String email,
    String password,
    int level,
  }) {
    return User(
      id: id ?? this.id,
      creation: creation ?? this.creation,
      type: type ?? this.type,
      email: email ?? this.email,
      password: password ?? this.password,
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'creation': creation,
      'type': type,
      'email': email,
      'password': password,
      'level': level,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      id: map['id'],
      creation: (map['creation'] as Timestamp)?.toDate() ?? null,
      type: map['type'],
      email: map['email'],
      password: map['password'],
      level: map['level'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, creation: $creation, type: $type, email: $email, password: $password, level: $level)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User && o.id == id && o.creation == creation && o.type == type && o.email == email && o.password == password && o.level == level;
  }

  @override
  int get hashCode {
    return id.hashCode ^ creation.hashCode ^ type.hashCode ^ email.hashCode ^ password.hashCode ^ level.hashCode;
  }
}
