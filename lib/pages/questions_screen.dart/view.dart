import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:worlds_factory/common.dart';
import 'package:worlds_factory/common/button.dart';
import 'package:worlds_factory/dao/questions_repository.dart';
import 'package:worlds_factory/pages/test_page/test_page.dart';

const _colors = [
  KColors.primary,
  KColors.error,
  KColors.waiting,
  KColors.success,
  KColors.secondary,
  KColors.primary,
  KColors.primary,
];

class QuestionsScreen extends HookWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questionsRepo = useProvider(questionsRepositoryProvider);
    final countdown = useState(6);
    final animation =
        useAnimationController(duration: const Duration(seconds: 1));

    void _startAnimation() {
      countdown.value = 6;
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (countdown.value == 0) {
          timer.cancel();
          context.navigate(const TestPage());
          countdown.value = 6;
        } else {
          countdown.value = countdown.value - 1;
          animation.forward(from: 0);
        }
      });
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                const TextSpan(text: 'There are ', style: kH4TextStyle),
                TextSpan(
                  text: questionsRepo.wordsCount.toString(),
                  style: kH4TextStyle.copyWith(color: KColors.primary),
                ),
                const TextSpan(
                    text: ' words in your Dictionary. \n\nStart the Training?',
                    style: kH4TextStyle),
              ]),
            ),
            if (countdown.value > 5)
              questionsRepo.wordsCount > 0
                  ? KButton('Start', onClick: _startAnimation)
                  : Text('Add words to start training')
            else
              Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: animation,
                    builder: (context, _) => SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        value: countdown.value / 5 - animation.value / 5,
                        color: _colors[countdown.value],
                        strokeWidth: 8,
                      ),
                    ),
                  ),
                  Text(
                    countdown.value > 0 ? countdown.value.toString() : 'GO!',
                    style:
                        kH1TextStyle.copyWith(color: _colors[countdown.value]),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
