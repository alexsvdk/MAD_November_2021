import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:worlds_factory/pages/onboarding_page/onboarding_page.dart';

import '../../common.dart';

class LaunchPage extends HookWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      final timer = Timer(const Duration(seconds: 1), () {
        context.navigateReplacement(const OnboardingPage());
      });
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/launch.png'),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'WordsFactory',
            style: kH1TextStyle,
          )
        ],
      ),
    );
  }
}
