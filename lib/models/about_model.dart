import 'package:cloud_firestore/cloud_firestore.dart';

class AboutDigitalContentManagement {
  final String title;
  final DateTime editDate;
  final String desc;
  final List<String> descByYears;

  AboutDigitalContentManagement({
    required this.title,
    required this.editDate,
    required this.desc,
    required this.descByYears,
  });

  factory AboutDigitalContentManagement.fromMap(Map<String, dynamic> map) {
    return AboutDigitalContentManagement(
      title: map['title'] ?? '',
      editDate: (map['editDate'] as Timestamp).toDate(),
      desc: map['desc'] ?? '',
      descByYears: List<String>.from(map['descByYears'] ?? []),
    );
  }

  // Additional methods or properties can be added as needed
}
