import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:worlds_factory/common.dart';
import 'package:worlds_factory/pages/test_page/body.dart';
import 'package:worlds_factory/pages/test_page/controller.dart';
import 'package:worlds_factory/pages/test_page/results.dart';

class TestPage extends HookWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useProvider(testPageControllerProvider);

    final timeAnimation = useAnimationController();

    useEffect(() {
      if (state?.question == null) return () {};
      const duration = Duration(seconds: 5);
      timeAnimation.value = 0;
      timeAnimation.animateTo(1, duration: duration);
      final timer = Timer(duration, () {
        context.read(testPageControllerProvider.notifier).answer(-1);
      });
      return timer.cancel;
    }, [state?.question]);

    final isCompleted = (state?.current ?? 0) > (state?.total ?? 1);

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: KColors.grey),
              ),
              child: const BackButton(),
            ),
            Expanded(
              child: isCompleted ? const Results() : const TestPageBody(),
            ),
            if (!isCompleted)
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: KColors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  AnimatedBuilder(
                      animation: timeAnimation,
                      builder: (context, _) {
                        return Container(
                          width: MediaQuery.of(context).size.width *
                              timeAnimation.value,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                KColors.error,
                                KColors.waiting,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        );
                      })
                ],
              )
          ],
        ),
      )),
    );
  }
}
