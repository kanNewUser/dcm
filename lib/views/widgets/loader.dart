import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class MyLoader extends StatelessWidget {
  const MyLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const GFLoader(
      type: GFLoaderType.custom,
      loaderIconOne: Icon(Icons.insert_emoticon),
      loaderIconTwo: Icon(Icons.insert_emoticon),
      loaderIconThree: Icon(Icons.insert_emoticon),
    );
  }
}
