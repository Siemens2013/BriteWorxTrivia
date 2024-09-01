import 'package:flutter/material.dart';
import 'package:briteworxtrivia/Test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class Testknopki extends StatefulWidget {
  const Testknopki({super.key});

  @override
  State<Testknopki> createState() => _TestknopkiState();
}

class _TestknopkiState extends State<Testknopki> {
  String svgloader='assets/images/Knopka.svg';
  String txtColor='Colors.white';
  @override
  int abc=0;
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.fromLTRB(45, 15, 25,0),
        child: GestureDetector(
          child: Stack(
            children:[
              SvgPicture.asset(svgloader, height: 36,width: 115),
              Padding(
                padding: const EdgeInsets.fromLTRB(23, 2, 25,0),
                child: Text("Game Topic", style: TextStyle(color: Colors.white,
                fontSize: 22, fontWeight: FontWeight.bold),)
              ),
            ]
          ),
          onTap: (){print(abc); abc++;},
        ),
      );
  }
}
