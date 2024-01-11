import 'package:dcm/models/contact_model.dart';

import 'package:dcm/services/firebase_services.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  var contactList =
      <DcmInfo>[].obs; // Use DcmInfo instead of Map<String, dynamic>

  @override
  void onInit() {
    super.onInit();
    fetchContact();
  }

  Future<void> fetchContact() async {
    final firebaseService = FirebaseService();
    final rawContacts = await firebaseService.fetchContact();

    // Map the raw contact data to DcmInfo instances
    contactList.value =
        rawContacts.map((contactMap) => DcmInfo.fromMap(contactMap)).toList();

    print(contactList);
  }
}
