import 'dart:developer';

import 'package:dcm/models/about_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AboutController extends GetxController {
  var aboutList = <AboutDigitalContentManagement>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAbout();
  }

  Future<void> fetchAbout() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('history').get();

      aboutList.value = querySnapshot.docs
          .map((doc) => AboutDigitalContentManagement.fromMap(doc.data()))
          .toList();

    } catch (e) {
      log('Error fetching about: $e');
    }
  }
}
