// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/planSelection/planDetailsRoute.dart';
import 'planSelectionCommon.dart';

class PlansScreenRoute extends StatelessWidget {
  const PlansScreenRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 28),
            PlanSelectionHeader(),
            SizedBox(height: 60),
            MainTitleWidget(),
            SizedBox(height: 54),
            SelectionRow(),
            SizedBox(height: 29),
            Text("Precio mensual cuando se termine\n el mes gratis.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontFamily: '.SF UI Text')),
            SizedBox(height: 25),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 39),
                child: TiersWidget(
                  widget1: Text("US 8,99"),
                  widget2: Text("US 8,99"),
                  widget3: Text("US 8,99"),
                )),
            SizedBox(height: 25),
            AvailableFeature(featureText: "HD disponible"),
            SizedBox(height: 25),
            AvailableFeature(featureText: "Ultra HD disponible"),
            SizedBox(height: 25),
            AvailableFeature(featureText: "Pantallas en las que puedes ver al mismo tiempo"),
            SizedBox(height: 25),
            AvailableFeature(featureText: "Ve en tu laptop, TV, telefono y tablet"),
            SizedBox(height: 25),
            AvailableFeature(featureText: "Películas y programas de TV ilimitados"),
            SizedBox(height: 25),
            AvailableFeature(featureText: "Cancela cuando quieras"),
            SizedBox(height: 25),
            AvailableFeature(featureText: "El primer mes es gratis"),
            SelectionBottom(),
            SizedBox(height: 32),
            BottomButtonWidget(txt: "CONTINUAR",onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PlanDetailsRoute()),
                );
            },),
            SizedBox(height: 30),
          ],
        )),
      ),
    );
  }
}

class AvailableFeature extends StatelessWidget {

// Image check widget
final String featureText;


  const AvailableFeature({
    super.key,
    required this.featureText
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
    Text(featureText,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14, fontFamily: '.SF UI Text')),
    SizedBox(height: 25),
    Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: TiersWidget(
          widget1: Image(image: AssetImage('images/check.png')),
          widget2: Image(image: AssetImage('images/check.png')),
          widget3: Image(image: AssetImage('images/check.png')),
        )),
    ],);
  }
}

class SelectionBottom extends StatelessWidget {
  const SelectionBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Text("La disponibilidad del contenido HD y Ultra HD depende de tu proveedor de servicios de internet y del dispositivo en uso. No todo el contenido está disponible en HD o Ultra HD. Consulta los Términos de uso para obtener más información.",
            style: TextStyle(fontSize: 14, fontFamily: '.SF UI Text')));
  }
}

class TiersWidget extends StatelessWidget {
  final Widget widget1;
  final Widget widget2;
  final Widget widget3;

  const TiersWidget({
    required this.widget1,
    required this.widget2,
    required this.widget3,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget1,
        const Text("|",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontFamily: '.SF UI Text')),
        widget2,
        const Text("|",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontFamily: '.SF UI Text')),
        widget3
      ],
    );
  }
}

class SelectionRow extends StatelessWidget {
  const SelectionRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 31),
        child: Row(
          children: [
            SelectionWidget(
              textMsg: "Basico",
            ),
            SizedBox(width: 5),
            SelectionWidget(textMsg: "Estandar"),
            SizedBox(width: 5),
            SelectionWidget(textMsg: "Basico"),
          ],
        ));
  }
}


class SelectionWidget extends StatefulWidget {
  final String textMsg;
  const SelectionWidget({super.key, required this.textMsg});
  

  @override
  State<SelectionWidget> createState() => _SelectionWidgetState();
}

class _SelectionWidgetState extends State<SelectionWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
  final ThemeData theme = Theme.of(context);
    return SizedBox(
      width: 101,
      height: 113,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Stack(children: <Widget>[
          Image(
            width: 101,
            height: 113,
            image: AssetImage( isSelected ? "images/blueBoxSelected.png" : "images/blueBoxUnselected.png"),
          ),
          Center(
              child: Text(widget.textMsg,
                  style: TextStyle(
                      color: theme.colorScheme.secondary,
                      fontSize: 17,
                      fontFamily: '.SF UI Text'),),),
        ]),
      ),
    );
  }

}

class MainTitleWidget extends StatelessWidget {
  const MainTitleWidget({
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
            Text("Selecciona el plan ideal para ti.",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 24, fontFamily: '.SF UI Text')),
          ]),
          SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Flexible(
                child: Text(
                    "Cambia a un plan inferior  o superior en cualquier momento",
                    style: TextStyle(fontSize: 17, fontFamily: '.SF UI Text')))
          ]),
        ],
      ),
    );
  }
}
