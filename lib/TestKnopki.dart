import 'dart:ffi';
//import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:flutter/material.dart';
import 'package:briteworxtrivia/Test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class Testknopki extends StatefulWidget {
  late final String txt;
   Testknopki({super.key, required this.txt});

  @override
  State<Testknopki> createState() => _TestknopkiState();
}

class _TestknopkiState extends State<Testknopki> {
  String svgloader='assets/images/Knopka.svg';
  String txtColor='Colors.white';
  double fntsize=18;
  bool pressed=false;
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
                padding: const EdgeInsets.fromLTRB(20, 2, 20,0),
                child: Text(widget.txt, style: TextStyle(color: Colors.white,
                fontSize: fntsize, fontWeight: FontWeight.bold),)
              ),
            ]
          ),
          onTap: (){setState(() {(svgloader='assets/images/Disabled.svg');
              fntsize=0;


          });},

        ),
      );
  }
}
