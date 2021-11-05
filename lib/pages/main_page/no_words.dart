import 'package:flutter/material.dart';
import 'package:worlds_factory/common.dart';

class NoWord extends StatelessWidget {
  const NoWord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/no_words.png'),
        const SizedBox(
          height: 32,
        ),
        const Text('No word', style: kH4TextStyle),
        const SizedBox(
          height: 16,
        ),
        const Text(
          'Input something to find it in dictionary',
          style: kSecondaryTextStyle,
        ),
      ],
    );
  }
}
