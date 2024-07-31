import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:briteworxtrivia/briteWorxTrivia.dart';
import 'package:flutter/services.dart';
import 'package:briteworxtrivia/containerBuilder.dart';

class SelectCategory extends StatefulWidget {

  const SelectCategory({super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}
class _SelectCategoryState extends State<SelectCategory> {
  List _elements=[];
  int i1=0;
  Future <void> readJason() async {
    final String response = await rootBundle.loadString('assets/Categories.json');
    final data = await json.decode(response);
    setState(() {
      _elements=data["items"];
      print(_elements[0]['Category'][0]);
    });
  }
  int nbrcol=2;   //Number of Column
  double hght_c=8;
  double wdth_c=9;
  double fntSize_c=0;
  int kolichestvo=15;
  int kolichestvo1=0;
   void defineConainer(){kolichestvo1=_elements.length;
       if (kolichestvo==9) {
                        nbrcol=3;hght_c=24;wdth_c=90;fntSize_c=12;
                         } else if (kolichestvo==10 || kolichestvo==11||kolichestvo==12 ){
                         nbrcol=4;hght_c=24;wdth_c=90;fntSize_c=12;
                                                               }
                            else if(kolichestvo==13||kolichestvo==14||kolichestvo==15) {
                              nbrcol=5;hght_c=24;wdth_c=90;fntSize_c=12;
                                                                 }
                            else if (kolichestvo==16||kolichestvo==17||kolichestvo==18) {
                            nbrcol=6;hght_c=24;wdth_c=90;fntSize_c=12;
                                                                  }
                          }

@override
  void initState(){
    readJason();
    //defineConainer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) { defineConainer();
    if (_elements.isEmpty){
      return Container();
    }
    return Scaffold(appBar: AppBar(title: Text('SELECT A CATEGORY',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
    ),
      backgroundColor: Colors.grey,
                    centerTitle: true,
                        actions: [
                              IconButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => BriteWorxTrivia()));
                                ;}, icon:Icon(Icons.home_filled))
      ],),

      body:  Row(children: [
                     Column(children: [
                                for (int i=0; i<nbrcol; i++)


                                  ContainerBuilder(hght: hght_c,
                                      wdth: wdth_c,
                                      txt: _elements[i]['Category'][0],
                                      fntSize: 12),



                     ],),
                     Column(children: [
                               for (int i=0; i<nbrcol; i++)
                                 ContainerBuilder(hght: hght_c,
                                     wdth: wdth_c,
                                     txt: _elements[i+nbrcol]['Category'][0],
                                     fntSize: 12)

                    ],),
                     Column(children: [
                               for (int i=0; i<nbrcol; i++)
                                //if (i+nbrcol<_elements.length) //2 karrani uchrdim
                                 ContainerBuilder(hght: hght_c,
                                     wdth: wdth_c,
                                     txt: _elements[i]['Category'][0],
                                     fntSize: 12)

                    ],)
                        ],)


      );


  }
}
