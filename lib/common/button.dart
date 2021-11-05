import 'package:flutter/material.dart';
import 'package:worlds_factory/common.dart';

class KButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  const KButton(
    this.text, {
    Key? key,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: KColors.primary,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
