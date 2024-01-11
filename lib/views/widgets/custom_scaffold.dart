import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;
  final Widget? drawer;

  const CustomScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.drawer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: body,
      ),
    );
  }
}
