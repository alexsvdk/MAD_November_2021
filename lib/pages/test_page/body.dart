import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:worlds_factory/common.dart';
import 'package:worlds_factory/pages/test_page/controller.dart';

final chars = {
  0: 'A',
  1: 'B',
  2: 'C',
};

class TestPageBody extends HookWidget {
  const TestPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useProvider(testPageControllerProvider);
    final selectedIndex = useState(-1);
    useEffect(() {
      selectedIndex.value = -1;
    }, [state?.question]);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${state?.current} of ${state?.total}',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          '${state?.question}',
          style: kH4TextStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        for (var i = 0; i < (state?.answers?.length ?? 0); i++) ...[
          const SizedBox(height: 16),
          GestureDetector(
            onTapDown: (_) {
              selectedIndex.value = i;
            },
            onTap: () =>
                context.read(testPageControllerProvider.notifier).answer(i),
            child: AnimatedContainer(
              key: ObjectKey(state!.answers![i]),
              duration: const Duration(milliseconds: 100),
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: selectedIndex.value == i
                    ? KColors.primary.withAlpha(30)
                    : Colors.white,
                border: Border.all(
                  color:
                      selectedIndex.value == i ? KColors.primary : KColors.grey,
                ),
              ),
              child: Text(
                '${chars[i]}   ${state.answers![i]}',
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ]
      ],
    );
  }
}
