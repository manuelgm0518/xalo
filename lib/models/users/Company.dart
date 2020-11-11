import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'User.dart';

class Company extends User {
  final String name;
  final String sector;
  final String size;
  final String orgType;
  final String logo;
  final String slogan;
  final String description;
  final List<String> pictures;
  final String location;

  Company({
    String id,
    DateTime creation,
    String email,
    String password,
    int level = 0,
    this.name,
    this.sector,
    this.size,
    this.orgType,
    this.logo,
    this.slogan,
    this.description,
    this.pictures,
    this.location,
  }) : super(
          id: id,
          creation: creation,
          email: email,
          password: password,
          level: level,
          type: 'company',
        );

  Company copyWith({
    String id,
    DateTime creation,
    String email,
    String password,
    String name,
    String sector,
    String size,
    String orgType,
    String logo,
    String slogan,
    String description,
    List<String> pictures,
    int level,
    GeoPoint location,
    String type,
  }) {
    return Company(
      id: id ?? this.id,
      creation: creation ?? this.creation,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      sector: sector ?? this.sector,
      size: size ?? this.size,
      orgType: orgType ?? this.orgType,
      logo: logo ?? this.logo,
      slogan: slogan ?? this.slogan,
      description: description ?? this.description,
      pictures: pictures ?? this.pictures,
      level: level ?? this.level,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'creation': creation,
      'email': email,
      'password': password,
      'name': name,
      'sector': sector,
      'size': size,
      'orgType': orgType,
      'logo': logo,
      'slogan': slogan,
      'description': description,
      'pictures': pictures,
      'level': level,
      'location': location,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return Company(
      id: map['id'],
      creation: (map['creation'] as Timestamp)?.toDate() ?? null,
      email: map['email'],
      password: map['password'],
      name: map['name'],
      sector: map['sector'],
      size: map['size'],
      orgType: map['orgType'],
      logo: map['logo'],
      slogan: map['slogan'],
      description: map['description'],
      pictures: List<String>.from(map['pictures'] ?? []),
      level: map['level'],
      location: map['location'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) => Company.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Company(id: $id, creation: $creation, email: $email, password: $password, name: $name, sector: $sector, size: $size, orgType: $orgType, logo: $logo, slogan: $slogan, description: $description, pictures: $pictures, level: $level, location: $location)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Company &&
        o.id == id &&
        o.creation == creation &&
        o.email == email &&
        o.password == password &&
        o.name == name &&
        o.sector == sector &&
        o.size == size &&
        o.orgType == orgType &&
        o.logo == logo &&
        o.slogan == slogan &&
        o.description == description &&
        listEquals(o.pictures, pictures) &&
        o.level == level &&
        o.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        creation.hashCode ^
        email.hashCode ^
        password.hashCode ^
        name.hashCode ^
        sector.hashCode ^
        size.hashCode ^
        orgType.hashCode ^
        logo.hashCode ^
        slogan.hashCode ^
        description.hashCode ^
        pictures.hashCode ^
        level.hashCode ^
        location.hashCode;
  }
}
