import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:worlds_factory/common.dart';
import 'package:worlds_factory/pages/launch_page/launch_page.dart';
import 'package:worlds_factory/pages/main_page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => DefaultTextStyle(
        style: kBaseTextStyle,
        child: ProviderScope(child: child ?? const SizedBox.shrink()),
      ),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}
