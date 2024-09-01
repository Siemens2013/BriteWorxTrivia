import 'dart:convert';
import 'package:briteworxtrivia/containerBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RawedCategories extends StatefulWidget {
  const RawedCategories({super.key});

  @override
  State<RawedCategories> createState() => _RawedCategoriesState();
}

class _RawedCategoriesState extends State<RawedCategories> {
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
        backgroundColor: Color.fromRGBO(56, 11, 112, 1),

      body:

      Container(height: double.infinity, width: double.infinity,
        decoration: BoxDecoration(image:DecorationImage(image: AssetImage('assets/images/Screen1.png')
        ) ),

        child: Scrollbar(interactive: true,thickness: 5,
          scrollbarOrientation: ScrollbarOrientation.right,
          thumbVisibility: true, radius: Radius.elliptical(19,19),
          child: SingleChildScrollView(scrollDirection: Axis.vertical,

            child: Column(
              children: [
            
                for (int i3=0; i3<sceloe; i3++)
            
                Row(
                  children: [
                    for (int i=0; i<nbrcol; i++)
                    ContainerBuilder(hght: 120, wdth:100,
                        txt: _elements[i5++]['Category'][0], fntSize: 12),
                  ],
                ),
                Row(children: [
                  for (int i4=0; i4<ostatok; i4++)
                    ContainerBuilder(hght: 110 , wdth:225,
                        txt: _elements[i5++]['Category'][0], fntSize: 24),
                ],)
              ],
            ),
          ),
        ),
      )


    );
  }
}
