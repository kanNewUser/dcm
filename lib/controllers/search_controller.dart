import 'package:dcm/models/courses_model.dart';
import 'package:get/get.dart';

class MySearchController extends GetxController {
  RxList<CourseModel> filteredCourses = <CourseModel>[].obs;

  void filterCourses(String query, List<CourseModel> allCourses) {
    if (query.isEmpty) {
      // If the search query is empty, show all courses
      filteredCourses.value = List<CourseModel>.from(allCourses);
    } else {
      // Filter courses based on the search query
      filteredCourses.value = allCourses
          .where((course) =>
              course.code.toLowerCase().contains(query.toLowerCase()) ||
              course.title.toLowerCase().contains(query.toLowerCase()) ||
              course.lecturer.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
