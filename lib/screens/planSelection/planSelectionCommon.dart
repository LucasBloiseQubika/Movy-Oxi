import 'package:flutter/material.dart';

class PlanSelectionHeader extends StatelessWidget {
  const PlanSelectionHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Image(image: AssetImage('images/BlueLogo.png')),
          Text(
            "Iniciar Session",
            style: TextStyle(
                color: theme.colorScheme.primary, fontFamily: '.SF UI Text'),
          ),
        ],
      ),
    );
  }
}

//change button and add text param
class BottomButtonWidget extends StatelessWidget {
  
  final String txt;
  final Function()? onTap;

  const BottomButtonWidget({
    required this.txt,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 43),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(
                40),
          ),
          onPressed: () {
            onTap?.call();
          },
          child:  Text(txt, style: const TextStyle(color: Colors.white),)),
    );
  }
}