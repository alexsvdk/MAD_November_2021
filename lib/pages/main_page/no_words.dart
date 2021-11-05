import 'package:flutter/material.dart';
import 'package:worlds_factory/common.dart';

class NoWord extends StatelessWidget {
  const NoWord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/no_words.png'),
        const Text('No word', style: kH4TextStyle),
        const Text(
          'Input something to find it in dictionary',
          style: kSecondaryTextStyle,
        ),
      ],
    );
  }
}
