import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Achievement {
  final String id;
  final DateTime creation;
  final List<String> tags;
  final String icon;
  final String color;
  final String name;
  final String from;
  final String to;
  final bool opened;
  final int experience;
  final String link;

  Achievement({
    this.id,
    this.creation,
    this.tags,
    this.icon,
    this.color,
    this.name,
    this.from,
    this.to,
    this.opened,
    this.experience,
    this.link,
  });

  Achievement copyWith({
    String id,
    DateTime creation,
    List<String> tags,
    String icon,
    String color,
    String name,
    String from,
    String to,
    bool opened,
    int experience,
    String link,
  }) {
    return Achievement(
      id: id ?? this.id,
      creation: creation ?? this.creation,
      tags: tags ?? this.tags,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      name: name ?? this.name,
      from: from ?? this.from,
      to: to ?? this.to,
      opened: opened ?? this.opened,
      experience: experience ?? this.experience,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'creation': creation,
      'tags': tags,
      'icon': icon,
      'color': color,
      'name': name,
      'from': from,
      'to': to,
      'opened': opened,
      'experience': experience,
      'link': link,
    };
  }

  factory Achievement.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Achievement(
      id: map['id'],
      creation: (map['creation'] as Timestamp)?.toDate() ?? null,
      tags: List<String>.from(map['tags'] ?? []),
      icon: map['icon'],
      color: map['color'],
      name: map['name'],
      from: map['from'],
      to: map['to'],
      opened: map['opened'],
      experience: map['experience'],
      link: map['link'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Achievement.fromJson(String source) => Achievement.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Achievement(id: $id, creation: $creation, tags: $tags, icon: $icon, color: $color, name: $name, from: $from, to: $to, opened: $opened, experience: $experience, link: $link)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Achievement &&
        o.id == id &&
        o.creation == creation &&
        listEquals(o.tags, tags) &&
        o.icon == icon &&
        o.color == color &&
        o.name == name &&
        o.from == from &&
        o.to == to &&
        o.opened == opened &&
        o.experience == experience &&
        o.link == link;
  }

  @override
  int get hashCode {
    return id.hashCode ^ creation.hashCode ^ tags.hashCode ^ icon.hashCode ^ color.hashCode ^ name.hashCode ^ from.hashCode ^ to.hashCode ^ opened.hashCode ^ experience.hashCode ^ link.hashCode;
  }
}
