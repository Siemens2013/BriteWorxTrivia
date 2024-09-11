import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:briteworxtrivia/optionButton.dart';
int lengthJson=0;
int optionNum=0;
int pressChoice=0;
Color clr0=Color.fromRGBO(249, 226, 166, 1);
Color clr1=Color.fromRGBO(249, 226, 166, 1);
Color clr2=Color.fromRGBO(249, 226, 166, 1);
Color clr3=Color.fromRGBO(249, 226, 166, 1);
class Gametitle extends StatefulWidget {
final String pathJson;
   Gametitle({super.key, required this.pathJson});

  @override
  State<Gametitle> createState() => _GametitleState();
}

class _GametitleState extends State<Gametitle> {
  List _elements=[];
  Future <void> readJason() async {
    final String response = await rootBundle.loadString(widget.pathJson);
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
    lengthJson=_elements.length;
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
                      padding: const EdgeInsets.fromLTRB(39, 8, 0, 0),
                      child: Image.asset(_elements[indexJson]['imagePath'], height: 160,),
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 58, 0, 0),
                          child: Container(height: 100, width: 258, color: Color.fromRGBO(56, 11, 112, 1), child: Center(child: Text(_elements[indexJson]['title'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24), textAlign: TextAlign.center),),),
                        ),
                        SizedBox(height: 4),
                       Column(children: [
                         Row(
                           children: [
                             Optionbutton(jsonOption: _elements[indexJson]['choices'][0],choice1: 0,
                             clr: clr0),
                             SizedBox(width: 8),
                             Optionbutton( jsonOption: _elements[indexJson]['choices'][1],choice1: 1,
                             clr: clr1),
                           ],
                         ),
                         SizedBox(height: 8),
                         Row(
                           children: [
                             Optionbutton( jsonOption: _elements[indexJson]['choices'][2],choice1: 2,
                             clr: clr2),
                             SizedBox(width: 8),
                             Optionbutton( jsonOption: _elements[indexJson]['choices'][3],choice1: 3,
                             clr: clr3),
                           ],
                         ),
                         SizedBox(height: 8),
                         GestureDetector(
                           child: Container(height: 23,width: 120, decoration: BoxDecoration(
                               image: DecorationImage(image: AssetImage('assets/images/ShowAnswerButton.png')),
                               borderRadius: BorderRadius.circular(10)),
                           ),
                           onTap: (){
                           if (_elements[indexJson]['correctChoice']==0) {
                             clr0=Color.fromRGBO(68, 193, 12, 1);
                           }
                           else { if (_elements[indexJson]['correctChoice']==1) {
                             clr1=Color.fromRGBO(68, 193, 12, 1);
                           } else { if (_elements[indexJson]['correctChoice']==2) {
                            clr2=Color.fromRGBO(68, 193, 12, 1);}
                             else { clr3=Color.fromRGBO(68, 193, 12, 1);}
                                 }}
                           },
                         ),
                       ],
                       )
                      ],
                    ),
                  ],
            ),
              Positioned(
                  right: 0,

                  child: Row(
                    children: [
                      Container(height: 25, width: 25, color: Colors.white,),
                      SizedBox(width: 4,),
                      Container(height: 25, width: 25, color: Colors.white,),
                    ],
                  ))
          ],
          )
      
    );
  }
}
