import 'package:dcm/constants/strings.dart';
import 'package:dcm/constants/text_style.dart';
import 'package:dcm/controllers/about_controller.dart';
import 'package:dcm/views/widgets/custom_scaffold.dart';
import 'package:dcm/views/widgets/drawer.dart';
import 'package:dcm/views/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  final AboutController _aboutController = Get.put(AboutController());

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(),
      drawer: MyDrawer(menuName: menuName),
      body: SingleChildScrollView(
        child: Obx(() {
          if (_aboutController.aboutList.isEmpty) {
            return const Center(child: MyLoader());
          } else {
            final about = _aboutController.aboutList.first;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
                  child: Text(
                    about.title.trim(),
                    softWrap: true,
                    style: kanitBoldTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    about.desc,
                    style: itimTextStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
                if (about.descByYears.isNotEmpty)
                  DescriptionList(descList: about.descByYears),
              ],
            );
          }
        }),
      ),
    );
  }

  Widget title() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GFTypography(
        text: "เกี่ยวกับเรา",
        type: GFTypographyType.typo1,
        fontWeight: FontWeight.bold,
        dividerWidth: double.maxFinite,
      ),
    );
  }
}

class DescriptionList extends StatelessWidget {
  final List<String> descList;

  const DescriptionList({super.key, required this.descList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: descList
          .map(
            (descYear) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                descYear.trim(),
                style: itimTextStyle,
              ),
            ),
          )
          .toList(),
    );
  }
}
