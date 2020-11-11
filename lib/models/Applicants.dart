import 'dart:convert';

class Applicants {
  final String id;
  final DateTime creation;
  final String vacant;
  final String company;
  final String talent;
  final String message;
  final String status; //Pendiente, aceptada, rechazada

  Applicants({
    this.id,
    this.creation,
    this.vacant,
    this.company,
    this.talent,
    this.message,
    this.status,
  });

  Applicants copyWith({
    String id,
    DateTime creation,
    String vacant,
    String company,
    String talent,
    String message,
    String status,
  }) {
    return Applicants(
      id: id ?? this.id,
      creation: creation ?? this.creation,
      vacant: vacant ?? this.vacant,
      company: company ?? this.company,
      talent: talent ?? this.talent,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'creation': creation?.millisecondsSinceEpoch,
      'vacant': vacant,
      'company': company,
      'talent': talent,
      'message': message,
      'status': status,
    };
  }

  factory Applicants.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Applicants(
      id: map['id'],
      creation: DateTime.fromMillisecondsSinceEpoch(map['creation']),
      vacant: map['vacant'],
      company: map['company'],
      talent: map['talent'],
      message: map['message'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Applicants.fromJson(String source) => Applicants.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Applicants(id: $id, creation: $creation, vacant: $vacant, company: $company, talent: $talent, message: $message, status: $status)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Applicants && o.id == id && o.creation == creation && o.vacant == vacant && o.company == company && o.talent == talent && o.message == message && o.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^ creation.hashCode ^ vacant.hashCode ^ company.hashCode ^ talent.hashCode ^ message.hashCode ^ status.hashCode;
  }
}
