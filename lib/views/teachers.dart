import 'package:dcm/constants/strings.dart';
import 'package:dcm/constants/text_style.dart';
import 'package:dcm/controllers/faculty_member_controller.dart';
import 'package:dcm/models/faculty_member_model.dart';
import 'package:dcm/views/widgets/custom_scaffold.dart';
import 'package:dcm/views/widgets/drawer.dart';
import 'package:dcm/views/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:url_launcher/url_launcher.dart';

class TeacherPage extends StatelessWidget {
  TeacherPage({super.key});

  final FacultyMemberController _memberController =
      Get.put(FacultyMemberController());

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(),
      drawer: MyDrawer(menuName: menuName),
      body: SingleChildScrollView(
        primary: true,
        child: Obx(() {
          if (_memberController.memberList.isEmpty) {
            return const Center(child: MyLoader());
          } else {
            final member = _memberController.memberList;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                _buildTitle(),
                ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: member.length,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey[300],
                  ),
                  itemBuilder: (context, index) {
                    return _buildMemberInfo(member[index]);
                  },
                ),
              ],
            );
          }
        }),
      ),
    );
  }

  Widget _buildTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GFTypography(
        text: "อาจารย์ประจำแขนงวิชาการจัดการดิจิทัลคอนเทนท์",
        type: GFTypographyType.typo1,
        fontWeight: FontWeight.bold,
        dividerWidth: double.maxFinite,
      ),
    );
  }

  Widget _buildMemberInfo(FacultyMember member) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: Image.network(member.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              "${member.title}${member.fullName}",
              softWrap: true,
              style: kanitBoldTextStyle,
            ),
          ),
          for (String position in member.positions)
            Text(
              "-$position",
              softWrap: true,
              style: itimTextStyle,
            ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(
              "Education History",
              softWrap: true,
              style: itimBoldTextStyle,
            ),
          ),
          for (String education in member.eduHistory)
            Text(
              education,
              softWrap: true,
              style: itimTextStyle,
            ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(
              "ช่องทางการติดต่อ",
              softWrap: true,
              style: itimBoldTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              "Tel: ${member.tel}",
              softWrap: true,
              style: itimTextStyle,
            ),
          ),
          for (String email in member.email)
            Text(
              email,
              softWrap: true,
              style: itimTextStyle,
            ),
          GestureDetector(
            onTap: () => _launchURL(member.website),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Website: ${member.website}",
                softWrap: true,
                style: itimTextStyle,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
