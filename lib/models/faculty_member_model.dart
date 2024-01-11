class FacultyMember {
  final String image;
  final String website;
  final List<String> eduHistory;
  final String fullName;
  final String tel;
  final List<String> positions;
  final String title;
  final List<String> email;

  FacultyMember({
    required this.image,
    required this.website,
    required this.eduHistory,
    required this.fullName,
    required this.tel,
    required this.positions,
    required this.title,
    required this.email,
  });

  factory FacultyMember.fromMap(Map<String, dynamic> map) {
    return FacultyMember(
      image: map['image'] ?? '',
      website: map['website'] ?? '',
      eduHistory: List<String>.from(map['eduHistory'] ?? []),
      fullName: map['fullName'] ?? '',
      tel: map['tel'] ?? '',
      positions: List<String>.from(map['positions'] ?? []),
      title: map['title'] ?? '',
      email: List<String>.from(map['email'] ?? []),
    );
  }

  // Additional methods or properties can be added as needed
}
