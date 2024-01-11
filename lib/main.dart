import 'package:cached_network_image/cached_network_image.dart';
import 'package:dcm/controllers/courses_controller.dart';
import 'package:dcm/controllers/search_controller.dart';
import 'package:dcm/firebase_options.dart';
import 'package:dcm/constants/strings.dart';

import 'package:dcm/views/widgets/drawer.dart';
import 'package:dcm/views/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      home: HomePage(
        menuName: menuName,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> menuName;
  HomePage({
    super.key,
    required this.menuName,
  });

  final CoursesController _coursesController = Get.put(CoursesController());
  final MySearchController _searchController = Get.put(MySearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(
        menuName: menuName,
      ),
      body: SingleChildScrollView(
          primary: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Obx(() {
              if (_coursesController.courseList.isEmpty) {
                return const Center(child: MyLoader());
              } else {
                final course = _searchController.filteredCourses.isEmpty
                    ? _coursesController.courseList
                    : _searchController.filteredCourses;
                return Column(
                  children: [
                    title(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: TextField(
                        onChanged: (query) {
                          _searchController.filterCourses(
                              query, _coursesController.courseList);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                color: Colors.red,
                              )),
                          labelText: 'Search',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: course.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => _launchURL(course[index].link.trim()),
                          child: GFListTile(
                            avatar: GFAvatar(
                              size: GFSize.SMALL,
                              child: CachedNetworkImage(
                                  placeholder: (context, url) => MyLoader(),
                                  imageUrl: course[index].image),
                              shape: GFAvatarShape.square,
                              radius: 50,
                            ),
                            titleText:
                                '${course[index].code}: ${course[index].title}',
                            subTitleText: 'By ${course[index].lecturer}',
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
            }),
          )),
    );
  }

  Widget title() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GFTypography(
        text: "DCM Digital Content Management",
        type: GFTypographyType.typo1,
        fontWeight: FontWeight.bold,
        dividerWidth: double.maxFinite,
      ),
    );
  }
}

void _launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
