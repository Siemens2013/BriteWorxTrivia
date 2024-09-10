import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:briteworxtrivia/TestKnopki.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}
class _TestState extends State<Test> {
  List _elements=[];
  Future <void> readJason() async {
    final String response = await rootBundle.loadString('assets/Game_Topic.json');
    final data = await json.decode(response);
    setState(() {
      _elements = data["items"];
      arifmetik();
    });
  }
  void arifmetik(){
    obshee=_elements.length;
    ostatok=obshee%2;
    sceloe=obshee~/2;
    print('ostatok   $ostatok');
    print('sceloe    $sceloe');
  }

int i=0, i1=0,i2=0,i3=0, a=0, ostatok=0, sceloe=0,obshee=0;
  @override
  void initState(){
    readJason();

    super.initState();
  }
  Widget build(BuildContext context) {
    i2=0;
    return Scaffold(appBar: AppBar(title: Text("Game Topic",
      style: TextStyle(color: Colors.white,
        fontSize: 38, fontWeight: FontWeight.bold),
    ),centerTitle: true,
    backgroundColor: Color.fromRGBO(56, 11, 112, 1),
    ),

        backgroundColor: Color.fromRGBO(56, 11, 112, 1),
      body:
      Stack(children: [
        SvgPicture.asset("assets/images/Group 644.svg"),
       ListView(
         children: [ Column(children:
         [
           for (i1=0;i1<sceloe; i1++)
           Row(children:
           [
             for (i=0;i<2;i++)

             Testknopki(txt: _elements[i2++]['Category'][0],abcd:  i2,
                path1: _elements[i3++]['GameTitle'][0],
             ),

           ],

               ),
           Row(children: [
             for(i=0;i<ostatok;i++)
               Testknopki(txt: _elements[i2++]['Category'][0],abcd:  i2,
                 path1: _elements[i3++]['GameTitle'][0],
               ),

           ],)
         ],
         ),]
       )

      ],
      )

    );

  }
}
