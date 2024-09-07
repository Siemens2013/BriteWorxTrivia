import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Gametitle extends StatefulWidget {

   Gametitle({super.key});

  @override
  State<Gametitle> createState() => _GametitleState();
}

class _GametitleState extends State<Gametitle> {
  List _elements=[];
  Future <void> readJason() async {
    final String response = await rootBundle.loadString('assets/Geographic.json');
    final data = await json.decode(response);
    setState(() {
      _elements = data["items"];

    });
  }
  @override
  void initState(){
    readJason();

    super.initState();
  }
  Widget build(BuildContext context) {
    readJason();
    if (_elements.isEmpty){
      return Container();
    }
    return Scaffold(backgroundColor: Color.fromRGBO(56, 11, 112, 1),
      body:
          Stack(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
              child: Center(child: SvgPicture.asset('assets/images/Group 644.svg',
              height: 210,
              )
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(137, 10, 0, 0),
              child: SvgPicture.asset('assets/images/GameTitle.svg', height: 45,),
            ),
            Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(39, 60, 0, 0),
                      child: Image.asset('assets/images/ImageFromJSN.png', height: 160,),
                    ),
                    SizedBox(width: 10),
                    Container(height: 100, width: 258, color: Color.fromRGBO(56, 11, 112, 1), child: Center(child: Text(_elements[0]['title'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24), textAlign: TextAlign.center),),),

                  ],
            ),

          ],
          )
      
    );
  }
}
