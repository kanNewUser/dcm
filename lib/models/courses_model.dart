class CourseModel {
  final String code;
  final String title;
  final String link;
  final String image;
  final String lecturer;
  CourseModel({
    required this.code,
    required this.title,
    required this.link,
    required this.image,
    required this.lecturer,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      code: json['code'] ?? '',
      title: json['title'] ?? '',
      link: json['link'] ?? '',
      image: json['image'] ?? '',
      lecturer: json['lecturer'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'title': title,
      'link': link,
      'image': image,
      'lecturer': lecturer,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      code: map['code'] ?? '',
      title: map['title'] ?? '',
      link: map['link'] ?? '',
      image: map['image'] ?? '',
      lecturer: map['lecturer'] ?? '',
    );
  }
}
