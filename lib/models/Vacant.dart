import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:xalo/models/FeedCard.dart';

class Vacant extends FeedCard {
  final String title;
  final String description;
  final String job;
  final String salary;
  final bool closed;

  Vacant({
    String id,
    DateTime creation,
    String owner,
    List<String> tags,
    this.title,
    this.description,
    this.job,
    this.salary = '0.00MXN',
    this.closed = false,
  }) : super(
          id: id,
          creation: creation,
          owner: owner,
          tags: tags,
          type: 'vacant',
        );

  Vacant copyWith({
    String id,
    DateTime creation,
    String owner,
    List<String> tags,
    String type,
    String title,
    String description,
    String job,
    String salary,
    bool closed,
  }) {
    return Vacant(
      id: id ?? this.id,
      creation: creation ?? this.creation,
      owner: owner ?? this.owner,
      tags: tags ?? this.tags,
      title: title ?? this.title,
      description: description ?? this.description,
      job: job ?? this.job,
      salary: salary ?? this.salary,
      closed: closed ?? this.closed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'creation': creation,
      'owner': owner,
      'tags': tags,
      'title': title,
      'description': description,
      'job': job,
      'salary': salary,
      'closed': closed,
    };
  }

  factory Vacant.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Vacant(
      id: map['id'],
      creation: (map['creation'] as Timestamp)?.toDate() ?? null,
      owner: map['owner'],
      tags: List<String>.from(map['tags'] ?? []),
      title: map['title'],
      description: map['description'],
      job: map['job'],
      salary: map['salary'],
      closed: map['closed'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Vacant.fromJson(String source) => Vacant.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Vacant(id: $id, creation: $creation, owner: $owner, tags: $tags, title: $title, description: $description, job: $job, salary: $salary, closed: $closed)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Vacant &&
        o.id == id &&
        o.creation == creation &&
        o.owner == owner &&
        listEquals(o.tags, tags) &&
        o.title == title &&
        o.description == description &&
        o.job == job &&
        o.salary == salary &&
        o.closed == closed;
  }

  @override
  int get hashCode {
    return id.hashCode ^ creation.hashCode ^ owner.hashCode ^ tags.hashCode ^ title.hashCode ^ description.hashCode ^ job.hashCode ^ salary.hashCode ^ closed.hashCode;
  }
}
