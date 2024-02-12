import 'dart:developer';

import 'package:dcm/models/faculty_member_model.dart';
import 'package:dcm/services/firebase_services.dart';
import 'package:get/get.dart';

class FacultyMemberController extends GetxController {
  var memberList = <FacultyMember>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFacultyMember();
  }

  Future<void> fetchFacultyMember() async {
    final firebaseService = FirebaseService();
    final List<Map<String, dynamic>> facultyData =
        await firebaseService.fetchFacultyMember();

    try {
      // Map the list of maps to a list of FacultyMember instances
    memberList.value = facultyData
        .map((map) => FacultyMember.fromMap(map))
        .toList(); // Convert the set to a list

    } catch (e) {
      log('Error fetching about: $e');
    }
  }
}
