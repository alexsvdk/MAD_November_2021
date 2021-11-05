import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:worlds_factory/common.dart';
import 'package:worlds_factory/common/button.dart';
import 'package:worlds_factory/pages/test_page/controller.dart';

class Results extends HookWidget {
  const Results({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useProvider(testPageControllerProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/res.png',
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          'Training is finished',
          style: kH4TextStyle,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
            'Correct: ${state?.correct}\nIncorrent: ${(state?.total ?? 1) - (state?.correct ?? 0)}'),
        const SizedBox(
          height: 32,
        ),
        KButton('Again',
            onClick: () =>
                context.read(testPageControllerProvider.notifier).startTest())
      ],
    );
  }
}
