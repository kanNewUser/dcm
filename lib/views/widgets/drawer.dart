import 'package:dcm/main.dart';
import 'package:dcm/constants/strings.dart';
import 'package:dcm/views/about.dart';
import 'package:dcm/views/contact.dart';
import 'package:dcm/views/teachers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  final List<String> menuName;

  const MyDrawer({super.key, required this.menuName});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          for (String menu in menuName)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: ListTile(
                title: Text(
                  menu,
                  softWrap: true,
                ),
                onTap: () {
                  // Handle menu item tap
                  _navigateToPage(menu);
                },
              ),
            ),
        ],
      ),
    );
  }
}

void _navigateToPage(String menu) {
  switch (menu) {
    case 'หน้าหลัก':
      Get.offAll(() => HomePage(
            menuName: menuName,
          ));
      break;
    case 'การรับสมัคร':
      launchURL(Uri.parse('https://admission.ssru.ac.th/'));
      break;
    case 'เกี่ยวกับสาขา':
      Get.to(() => AboutPage());
      break;
    case 'แผนการเรียน':
      launchURL(Uri(
          scheme: 'file',
          path:
              'http://www.dcm.sci.ssru.ac.th/useruploads/files/20211113/dd2fbccc0d2e7113c7325aeaad6b2b38da52e300.pdf'));
      break;
    case 'ติดต่ออาจารย์ผู้สอน':
      Get.to(() => TeacherPage());
      break;
    case 'ติดต่อเรา':
      Get.to(() => ContactPage());
      break;
    default:
      break;
  }
}

void launchURL(Uri url) async {
  if (await canLaunchUrl(
    url,
  )) {
    await launchUrl(
      url,
    );
  } else {
    throw 'Could not launch $url';
  }
}
