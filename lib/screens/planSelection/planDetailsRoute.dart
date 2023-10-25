

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/planSelection/planSelectionCommon.dart';

class PlanDetailsRoute extends StatelessWidget {
  const PlanDetailsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: 
      Column(children: [
        SizedBox(height: 28),
        PlanSelectionHeader(),
        DetailContentsWidget(),
      ],)
      ),
    );
  }

}

class DetailContentsWidget extends StatelessWidget {
  const DetailContentsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 33),
      child: Column(
    children: [
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text("PASO 1 DE 3",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 13.7, fontFamily: '.SF UI Text')),
      ]),
      SizedBox(height: 5),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text("Crea tu cuenta.",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 24, fontFamily: '.SF UI Text')),
      ]),
      SizedBox(height: 5),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Flexible(
          child: Text("Usa tu email y crea una contraseña para ver Netflix en cualquier dispositivo, cuando quieras.",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 17, fontFamily: '.SF UI Text')),
        ),
      ]),
    ],
      ),
    );
  }
}