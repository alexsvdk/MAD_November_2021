import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:worlds_factory/common.dart';
import 'package:worlds_factory/common/button.dart';
import 'package:worlds_factory/pages/login_page/login_page.dart';

class OnboardingPage extends HookWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageIndex = useState(0);
    final pageController = usePageController();

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Spacer(),
            SizedBox(
              height: 400,
              child: PageView(
                onPageChanged: (i) => pageIndex.value = i,
                controller: pageController,
                children: [for (var i = 0; i < 3; i++) _buildOnboarding(i)],
              ),
            ),
            SizedBox(
              width: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var i = 0; i < 3; i++)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: pageIndex.value == i
                          ? const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 12,
                            )
                          : const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: pageIndex.value == i
                            ? KColors.secondary
                            : Colors.grey.shade400,
                      ),
                    )
                ],
              ),
            ),
            Spacer(),
            KButton(
              pageIndex.value < 2 ? 'Next' : 'Let’s Start',
              onClick: () {
                if (pageIndex.value < 2) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                } else {
                  context.navigateReplacement(Scaffold(body: LoginPage()));
                }
              },
            ),
          ],
        ),
      )),
    );
  }

  Widget _buildOnboarding(int index) {
    final image = 'assets/images/ob_${index + 1}.png';
    final title = const [
      'Learn anytime and anywhere',
      'Find a course for you',
      'Improve your skills',
    ][index];
    final text = '''
    Quarantine is the perfect time to spend your
    day learning something new, from anywhere!
    '''
        .trimLeft();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(image),
        Text(
          title,
          style: kH4TextStyle,
        ),
        Text(text),
      ],
    );
  }
}
