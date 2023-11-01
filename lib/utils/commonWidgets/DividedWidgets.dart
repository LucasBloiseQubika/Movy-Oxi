import 'package:flutter/material.dart';

class DividedWidgets extends StatelessWidget {
  final Widget widget1;
  final Widget widget2;
  final Widget widget3;
  final Widget spacer;

  const DividedWidgets({
    required this.widget1,
    required this.widget2,
    required this.widget3,
    required this.spacer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget1,
        spacer,
        widget2,
        spacer,
        widget3
      ],
    );
  }
}