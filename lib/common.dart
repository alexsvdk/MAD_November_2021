import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kBaseTextStyle = TextStyle(fontFamily: 'Rubik');

const kH1TextStyle = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w700,
  fontSize: 40,
);

const kH4TextStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w500,
  fontSize: 24,
);

const kSecondaryTextStyle = TextStyle(
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w400,
  fontSize: 14,
  color: KColors.grey,
);

final kInputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide(color: KColors.grey),
    borderRadius: BorderRadius.circular(16),
  ),
);

class KColors {
  static const primary = Color.fromARGB(255, 227, 86, 42);
  static const error = Color.fromARGB(255, 239, 73, 73);
  static const waiting = Color.fromARGB(255, 242, 160, 63);
  static const success = Color.fromARGB(255, 91, 160, 146);
  static const secondary = Color.fromARGB(255, 101, 170, 234);
  static const grey = Color.fromARGB(255, 120, 116, 109);
}

extension BuildContextX on BuildContext {
  void navigate(Widget widget) {
    Navigator.of(this).push(CupertinoPageRoute(builder: (_) => widget));
  }

  void navigateReplacement(Widget widget) {
    Navigator.of(this)
        .pushReplacement(CupertinoPageRoute(builder: (_) => widget));
  }
}
