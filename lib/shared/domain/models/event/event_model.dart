// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class EventModel {
  String? id;
  String? title;
  List<String>? participants;
  DateTime? startTime;
  DateTime? endTime;
  bool? recurring;
  String? status;
  String? userId;
  String? meetingLink;
  String? otherDetails;
  bool? allDay;
  int? participantsCount;
  DateTime? createdAt;
  DateTime? updatedAt;
  EventModel({
    this.id,
    this.title,
    this.participants,
    this.startTime,
    this.endTime,
    this.recurring,
    this.status,
    this.userId,
    this.meetingLink,
    this.otherDetails,
    this.allDay,
    this.participantsCount,
    this.createdAt,
    this.updatedAt,
  });

  EventModel copyWith({
    String? id,
    String? title,
    List<String>? participants,
    DateTime? startTime,
    DateTime? endTime,
    bool? recurring,
    String? status,
    String? userId,
    String? meetingLink,
    String? otherDetails,
    bool? allDay,
    int? participantsCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      participants: participants ?? this.participants,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      recurring: recurring ?? this.recurring,
      status: status ?? this.status,
      userId: userId ?? this.userId,
      meetingLink: meetingLink ?? this.meetingLink,
      otherDetails: otherDetails ?? this.otherDetails,
      allDay: allDay ?? this.allDay,
      participantsCount: participantsCount ?? this.participantsCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'participants': participants,
      'startTime': startTime?.millisecondsSinceEpoch,
      'endTime': endTime?.millisecondsSinceEpoch,
      'recurring': recurring,
      'status': status,
      'userId': userId,
      'meetingLink': meetingLink,
      'otherDetails': otherDetails,
      'allDay': allDay,
      'participantsCount': participantsCount,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      participants: map['participants'] == null
          ? []
          : List<String>.from(map["participants"].map((x) => x)),
      startTime: map['startTime'] != null
          ? DateTime.parse(map['startTime'])
          : DateTime.now(),
      endTime: map['endTime'] != null
          ? DateTime.parse(map['endTime'])
          : DateTime.now(),
      recurring: map['recurring'] ?? false,
      status: map['status'] ?? '',
      userId: map['userId'] ?? '',
      meetingLink: map['meetingLink'] ?? '',
      otherDetails: map['otherDetails'] ?? '',
      allDay: map['allDay'] ?? '',
      participantsCount: map['participantsCount'] ?? '',
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'])
          : DateTime.now(),
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'])
          : DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EventModel(id: $id, title: $title, participants: $participants, startTime: $startTime, endTime: $endTime, recurring: $recurring, status: $status, userId: $userId, meetingLink: $meetingLink, otherDetails: $otherDetails, allDay: $allDay, participantsCount: $participantsCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant EventModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        listEquals(other.participants, participants) &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.recurring == recurring &&
        other.status == status &&
        other.userId == userId &&
        other.meetingLink == meetingLink &&
        other.otherDetails == otherDetails &&
        other.allDay == allDay &&
        other.participantsCount == participantsCount &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        participants.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        recurring.hashCode ^
        status.hashCode ^
        userId.hashCode ^
        meetingLink.hashCode ^
        otherDetails.hashCode ^
        allDay.hashCode ^
        participantsCount.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
