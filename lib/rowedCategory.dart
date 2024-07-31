import 'dart:convert';
import 'package:briteworxtrivia/containerBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RawedCategories extends StatefulWidget {
  const RawedCategories({super.key});

  @override
  State<RawedCategories> createState() => _RawedCategoriesState();
}

class _RawedCategoriesState extends State<RawedCategories> {
  List _elements=[];
  int i1=0;
  Future <void> readJason() async{
    final String response =await rootBundle.loadString('assets/Categories.json');
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
  int nbrcol=3;
  int kolich_a=8;
  int b=3;
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
    print('i5    ----- $i5');
    return Scaffold(appBar: AppBar(title: Text('SELECT A CATEGORIES !!!',
                                            style: TextStyle(fontSize: 28,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                                                  ),
                                           centerTitle: true,backgroundColor: Colors.grey,
                                                ),

      body: Column(
        children: [

          for (int i3=0; i3<sceloe; i3++)

          Row(
            children: [
              for (int i=0; i<nbrcol; i++)
              ContainerBuilder(hght: 24, wdth:99, txt: _elements[i5++]['Category'][0], fntSize: 12),
            ],
          ),
          Row(children: [
            for (int i4=0; i4<ostatok; i4++)
              ContainerBuilder(hght: 24, wdth:99, txt: _elements[i5++]['Category'][0], fntSize: 12),
          ],)
        ],
      )


    );
  }
}
