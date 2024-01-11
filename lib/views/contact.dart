import 'package:dcm/constants/strings.dart';
import 'package:dcm/constants/text_style.dart';
import 'package:dcm/controllers/contact_controller.dart';
import 'package:dcm/views/widgets/custom_scaffold.dart';
import 'package:dcm/views/widgets/drawer.dart';
import 'package:dcm/views/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class ContactPage extends StatelessWidget {
  final ContactController _contactController = Get.put(ContactController());

  ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(),
      drawer: MyDrawer(menuName: menuName),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title(),
            Obx(() {
              if (_contactController.contactList.isEmpty) {
                return const Center(child: MyLoader());
              } else {
                final contact = _contactController.contactList.first;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildContactDetail('สถานที่ตั้ง', contact.location),
                    _buildTransportation(contact.transportation),
                    _buildContactDetail('แผนที่ภายใน', ''),
                    Image.asset('assets/images/map.jpg'),
                    _buildContactDetail(
                        'สอบถามรายละเอียดเพิ่มเติม', contact.tel),
                    _buildContactDetail('WEBSITE', contact.website),
                    _buildContactDetail('FACEBOOK', contact.facebook),
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildContactDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              label,
              style: kanitBoldTextStyle,
            ),
          ),
          Text(
            value,
            style: itimTextStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildTransportation(List<String> transportation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'การคมานคม',
            style: kanitBoldTextStyle,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: transportation.length,
          itemBuilder: (context, index) => Text(' ${transportation[index]}'),
        ),
      ],
    );
  }

  Widget title() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GFTypography(
        text: "ติดต่อเรา",
        type: GFTypographyType.typo1,
        fontWeight: FontWeight.bold,
        dividerWidth: double.maxFinite,
      ),
    );
  }
}
