import 'package:dcm/models/courses_model.dart';
import 'package:dcm/services/firebase_services.dart';
import 'package:get/get.dart';

class CoursesController extends GetxController {
  var courseList = <CourseModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCourses();
  }

  Future<void> fetchCourses() async {
    final firebaseService = FirebaseService();
    final List<Map<String, dynamic>> facultyData =
        await firebaseService.fetchCourses();

    // Map the list of maps to a list of FacultyMember instances
    courseList.value = facultyData
        .map((map) => CourseModel.fromMap(map))
        .toList(); // Convert the set to a list

  }
}
