import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ChatRoom {
  final String id;
  final DateTime creation;
  final String icon;
  final List<String> members;
  final String title;
  final List<Map<String, dynamic>> messages;
  /*
    - sender
    - text
    - time
  */

  ChatRoom({
    this.id,
    this.creation,
    this.icon,
    this.members,
    this.title,
    this.messages,
  });

  ChatRoom copyWith({
    String id,
    DateTime creation,
    String icon,
    List<String> members,
    String title,
    List<Map<String, dynamic>> messages,
  }) {
    return ChatRoom(
      id: id ?? this.id,
      creation: creation ?? this.creation,
      icon: icon ?? this.icon,
      members: members ?? this.members,
      title: title ?? this.title,
      messages: messages ?? this.messages,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'creation': creation,
      'icon': icon,
      'members': members,
      'title': title,
      'messages': messages,
    };
  }

  factory ChatRoom.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return ChatRoom(
      id: map['id'],
      creation: (map['creation'] as Timestamp)?.toDate() ?? null,
      icon: map['icon'],
      members: List<String>.from(map['members']),
      title: map['title'],
      messages: List<Map<String, dynamic>>.from(map['messages']?.map((x) => x)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatRoom.fromJson(String source) => ChatRoom.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatRoom(id: $id, creation: $creation, icon: $icon, members: $members, title: $title, messages: $messages)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ChatRoom && o.id == id && o.creation == creation && o.icon == icon && listEquals(o.members, members) && o.title == title && listEquals(o.messages, messages);
  }

  @override
  int get hashCode {
    return id.hashCode ^ creation.hashCode ^ icon.hashCode ^ members.hashCode ^ title.hashCode ^ messages.hashCode;
  }
}
