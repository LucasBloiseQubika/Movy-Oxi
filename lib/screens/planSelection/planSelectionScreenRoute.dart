import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/planSelection/planOptionsRoute.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/HomePageBloc.dart';
import 'planSelectionCommon.dart';


class PlanSelectionScreenRoute extends StatelessWidget {
  const PlanSelectionScreenRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Content(),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 28,
        ),
        PlanSelectionHeader(),
        SizedBox(
          height: 89,
        ),
        MainContentWidget(),
        SizedBox(
          height: 34,
        ),
        CheckRowListWidget(),
        Spacer(),
        BottomButtonWidget(
        txt: "VER LOS PLANES",
        onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PlansScreenRoute()),
              );
        }),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}



class MainContentWidget extends StatelessWidget {
  const MainContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 33),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Image(image: AssetImage('images/tick.png'))]),
          SizedBox(
            height: 25,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text("PASO 1 DE 3",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 13.7, fontFamily: '.SF UI Text')),
          ]),
          SizedBox(
            height: 5,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text("Selecciona tu plan.",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 24, fontFamily: '.SF UI Text')),
          ]),
        ],
      ),
    );
  }
}

class CheckRowListWidget extends StatelessWidget {
  const CheckRowListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CheckRowWidget(
            mText: "No se te cobrará hasta \nque termine tu mes gratis."),
        CheckRowWidget(
            mText:
                "Te recordaremos tres días antes \n de que termine tu prueba."),
        CheckRowWidget(mText: "Sin compromisos,\n cancela cuando quieras..")
      ],
    );
  }
}



class CheckRowWidget extends StatelessWidget {
  final String mText;

  const CheckRowWidget({Key? key, required this.mText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(18),
          child: Image(image: AssetImage('images/check.png')),
        ),
        Flexible(
            child: Text(mText,
                style: TextStyle(fontSize: 17, fontFamily: '.SF UI Text')))
      ],
    );
  }
}
