import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FeedCard {
  final String id;
  final DateTime creation;
  final String owner;
  final List<String> tags;
  final String type;

  FeedCard({
    this.id,
    this.creation,
    this.owner,
    this.tags,
    this.type,
  });

  FeedCard copyWith({
    String id,
    DateTime creation,
    String owner,
    List<String> tags,
    String type,
  }) {
    return FeedCard(
      id: id ?? this.id,
      creation: creation ?? this.creation,
      owner: owner ?? this.owner,
      tags: tags ?? this.tags,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'creation': creation?.millisecondsSinceEpoch,
      'owner': owner,
      'tags': tags,
      'type': type,
    };
  }

  factory FeedCard.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return FeedCard(
      id: map['id'],
      creation: (map['creation'] as Timestamp).toDate() ?? [],
      owner: map['owner'],
      tags: List<String>.from(map['tags'] ?? []),
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedCard.fromJson(String source) => FeedCard.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FeedCard(id: $id, creation: $creation, owner: $owner, tags: $tags, type: $type)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FeedCard && o.id == id && o.creation == creation && o.owner == owner && listEquals(o.tags, tags) && o.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^ creation.hashCode ^ owner.hashCode ^ tags.hashCode ^ type.hashCode;
  }
}
