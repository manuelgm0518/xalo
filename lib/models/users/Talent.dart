import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'User.dart';

class Talent extends User {
  final String firstName;
  final String lastName;
  final String picture;
  final String biography;
  final String occupation;
  final String country;
  final String state;
  final bool isAdmin;

  Talent({
    String id,
    DateTime creation,
    String email,
    String password,
    int level = 0,
    this.firstName,
    this.lastName,
    this.picture,
    this.biography,
    this.occupation,
    this.country,
    this.state,
    this.isAdmin,
  }) : super(
          id: id,
          creation: creation,
          email: email,
          password: password,
          level: level,
          type: 'talent',
        );

  Talent copyWith({
    String id,
    DateTime creation,
    String email,
    String password,
    String firstName,
    String lastName,
    String picture,
    String biography,
    String occupation,
    int level,
    String country,
    String state,
    bool isAdmin,
    String type,
  }) {
    return Talent(
      id: id ?? this.id,
      creation: creation ?? this.creation,
      email: email ?? this.email,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      picture: picture ?? this.picture,
      biography: biography ?? this.biography,
      occupation: occupation ?? this.occupation,
      level: level ?? this.level,
      country: country ?? this.country,
      state: state ?? this.state,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'creation': creation,
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'picture': picture,
      'biography': biography,
      'occupation': occupation,
      'level': level,
      'country': country,
      'state': state,
      'isAdmin': isAdmin,
    };
  }

  factory Talent.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Talent(
      id: map['id'],
      creation: (map['creation'] as Timestamp)?.toDate() ?? null,
      email: map['email'],
      password: map['password'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      picture: map['picture'],
      biography: map['biography'],
      occupation: map['occupation'],
      level: map['level'],
      country: map['country'],
      state: map['state'],
      isAdmin: map['isAdmin'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Talent.fromJson(String source) => Talent.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Talent(id: $id, creation: $creation, email: $email, password: $password, firstName: $firstName, lastName: $lastName, picture: $picture, biography: $biography, occupation: $occupation, level: $level, country: $country, state: $state, isAdmin: $isAdmin)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Talent &&
        o.id == id &&
        o.creation == creation &&
        o.email == email &&
        o.password == password &&
        o.firstName == firstName &&
        o.lastName == lastName &&
        o.picture == picture &&
        o.biography == biography &&
        o.occupation == occupation &&
        o.level == level &&
        o.country == country &&
        o.state == state &&
        o.isAdmin == isAdmin;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        creation.hashCode ^
        email.hashCode ^
        password.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        picture.hashCode ^
        biography.hashCode ^
        occupation.hashCode ^
        level.hashCode ^
        country.hashCode ^
        state.hashCode ^
        isAdmin.hashCode;
  }
}
