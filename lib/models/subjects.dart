import 'package:cloud_firestore/cloud_firestore.dart';

class Subjects {
  String subject;
  Timestamp startTime;
  Timestamp endTime;

  Subjects({
    required this.subject,
    required this.startTime,
    required this.endTime,
  });

  Subjects.fromJson(Map<String, Object?> json)
      : this(
          subject: json['subject']! as String,
          startTime: json['startTime']! as Timestamp,
          endTime: json['endTime']! as Timestamp,
        );

  Subjects copyWith({
    String? subject,
    Timestamp? startTime,
    Timestamp? endTime,
  }) {
    return Subjects(
        subject: subject ?? this.subject,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime);
  }

  Map<String, Object?> toJson() {
    return {
      'subject': subject,
      'startTime': startTime,
      'endTime': endTime,
    };
  }
}
