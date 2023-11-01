import 'package:flutter/material.dart';

class ShadowOverlay extends StatelessWidget {
  final Widget child;

  final double shadowHeight, shadowWidth;

  final Color shadowColor;
  const ShadowOverlay(
      {Key? key,
      required this.child,
      this.shadowColor = Colors.black,
      required this.shadowHeight,
      required this.shadowWidth})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Stack(
        children: [
          child,
          Positioned(
            bottom: -1,
            child: Container(
              height: shadowHeight,
              width: shadowWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [shadowColor, shadowColor.withOpacity(0)],
                ),
              ),
            ),
          )
        ],
      );
}