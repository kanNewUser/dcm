// models/dcm_info.dart

class DcmInfo {
  final List<String> images;
  final String website;
  final String facebook;
  final String location;
  final String tel;
  final List<String> transportation;

  DcmInfo({
    required this.images,
    required this.website,
    required this.facebook,
    required this.location,
    required this.tel,
    required this.transportation,
  });

  // Factory method to create a DcmInfo instance from a map
  factory DcmInfo.fromMap(Map<String, dynamic> map) {
    return DcmInfo(
      images: List<String>.from(map['image']),
      website: map['website'] ?? '',
      facebook: map['facebook'] ?? '',
      location: map['location'] ?? '',
      tel: map['tel'] ?? '',
      transportation: List<String>.from(map['transportation']),
    );
  }
}
