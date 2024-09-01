import 'dart:convert';
import 'package:briteworxtrivia/containerBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RawedCategories1 extends StatefulWidget {
  const RawedCategories1({super.key});

  @override
  State<RawedCategories1> createState() => _RawedCategories1State();
}

class _RawedCategories1State extends State<RawedCategories1> {
  List _elements=[];
  int i1=0;
  Future <void> readJason() async{
    final String response =await rootBundle.loadString('assets/Game_Topic.json');
    final data = await json.decode(response);
    setState(() {
      _elements=data["items"];
      arifmetika();

    });
  }
  double hght_c=8;
  double wdth_c=9;
  double fntSize_c=0;
  double kolichestvo=10;
  int uzunlik=0;
  int nbrcol=2;
  int kolich_a=17;        //Number of Containers depends on length of json
  int b=2;
  int ostatok=0;
  int sceloe=0;
  int i5=0;

  @override


void arifmetika(){

  ostatok=kolich_a%b;
  sceloe=kolich_a~/b;
  print('Ostatok = $ostatok');
  print('Seloe chislo= $sceloe');
  }

  void initState(){
    readJason();
    //defineConainer();
    super.initState();
  }


  Widget build(BuildContext context) {
    if (_elements.isEmpty) {

      return Container();

    }
    print('i5    ----- $i5');i5=0;
    return Scaffold(appBar: AppBar(title: Text('SELECT A GAME', style:
      TextStyle(fontSize: 35, fontWeight: FontWeight.w900,height: 75 ,
          color: Colors.white),
    ),
    centerTitle: true,backgroundColor: Color.fromRGBO(56, 11, 112, 1)
      ,),
        body:
        SvgPicture.asset('assets/images/Group 644.svg',),
        backgroundColor: Color.fromRGBO(56, 11, 112, 1),
        //SvgPicture.asset('assets/images/Group 644.svg'),

    );
  }
}
