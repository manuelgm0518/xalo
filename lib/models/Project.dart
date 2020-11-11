import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:xalo/models/FeedCard.dart';

class Project extends FeedCard {
  final DateTime expiration;
  final String title;
  final String description;
  final List<String> resources;
  final List<Map<String, dynamic>> xalos;
  bool get isActive => this.creation.compareTo(expiration).isNegative;
  // id
  // tipo usuario
  // fecha

  Project({
    String id,
    DateTime creation,
    String owner,
    List<String> tags,
    this.expiration,
    this.title,
    this.description,
    this.resources,
    this.xalos,
  }) : super(
          id: id,
          creation: creation,
          owner: owner,
          tags: tags,
          type: 'project',
        );

  Project copyWith({
    String id,
    DateTime creation,
    String owner,
    List<String> tags,
    String type,
    DateTime expiration,
    String title,
    String description,
    List<String> resources,
    List<Map<String, dynamic>> xalos,
  }) {
    return Project(
      id: id ?? this.id,
      creation: creation ?? this.creation,
      owner: owner ?? this.owner,
      tags: tags ?? this.tags,
      expiration: expiration ?? this.expiration,
      title: title ?? this.title,
      description: description ?? this.description,
      resources: resources ?? this.resources,
      xalos: xalos ?? this.xalos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'creation': creation,
      'owner': owner,
      'tags': tags,
      'type': type,
      'expiration': expiration,
      'title': title,
      'description': description,
      'resources': resources,
      'xalos': xalos,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return Project(
      id: map['id'],
      creation: (map['creation'] as Timestamp)?.toDate() ?? null,
      owner: map['owner'],
      tags: List<String>.from(map['tags'] ?? []),
      expiration: (map['expiration'] as Timestamp)?.toDate() ?? null,
      title: map['title'],
      description: map['description'],
      resources: List<String>.from(map['resources']),
      xalos: List<Map<String, dynamic>>.from(map['xalos']?.map((x) => x) ?? []),
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) => Project.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Project(id: $id, creation: $creation, owner: $owner, tags: $tags, type: $type, expiration: $expiration, title: $title, description: $description, resources: $resources, xalos: $xalos)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Project &&
        o.id == id &&
        o.creation == creation &&
        o.owner == owner &&
        listEquals(o.tags, tags) &&
        o.type == type &&
        o.expiration == expiration &&
        o.title == title &&
        o.description == description &&
        listEquals(o.resources, resources) &&
        listEquals(o.xalos, xalos);
  }

  @override
  int get hashCode {
    return id.hashCode ^ creation.hashCode ^ owner.hashCode ^ tags.hashCode ^ type.hashCode ^ expiration.hashCode ^ title.hashCode ^ description.hashCode ^ resources.hashCode ^ xalos.hashCode;
  }
}
