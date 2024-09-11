import 'dart:io';

import 'package:briteworxtrivia/GameTitle.dart';
import 'package:flutter/cupertino.dart';
int indexJson=0;
int pressChoice=0;

class Optionbutton extends StatefulWidget {
 //final String assetPath;
 final String jsonOption;
 final Color clr;
 int choice1=0;
   Optionbutton({super.key, required this.jsonOption,
     required this.choice1, required this.clr});

  @override
  State<Optionbutton> createState() => _OptionbuttonState();
}
void incrementOfjson(){
  if (indexJson<= lengthJson-2) {
    clr0=Color.fromRGBO(249, 226, 166, 1);
    clr1=Color.fromRGBO(249, 226, 166, 1);
    clr2=Color.fromRGBO(249, 226, 166, 1);
    clr3=Color.fromRGBO(249, 226, 166, 1);
    indexJson = indexJson + 1;
  }
  else {
    indexJson=0;
  }
}
class _OptionbuttonState extends State<Optionbutton> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Container(height: 23,width: 120,

       decoration: BoxDecoration(color: widget.clr,
       borderRadius: BorderRadius.circular(10),
       ),

        child: Text(widget.jsonOption,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14 ), textAlign: TextAlign.center,),

         ),
      onTap: (){  print(widget.choice1);

      print('answerchoice1, $answerchoice');
         if (answerchoice==widget.choice1 && widget.choice1==0) {
           clr0=Color.fromRGBO(68, 193, 12, 1);
           Future.delayed(const Duration(seconds: 3), () {
             incrementOfjson();
           }) ;
         }
         else { if (answerchoice==widget.choice1 && widget.choice1==1){
           clr1=Color.fromRGBO(68, 193, 12, 1);
           Future.delayed(const Duration(seconds: 3), () {
             incrementOfjson();
           }) ;
         }else{
           if (answerchoice==widget.choice1 && widget.choice1==2){
             clr2=Color.fromRGBO(68, 193, 12, 1);
             Future.delayed(const Duration(seconds: 3), () {
               incrementOfjson();
             }) ;
           }else{if (answerchoice==widget.choice1 && widget.choice1==3){
             clr3=Color.fromRGBO(68, 193, 12, 1);
             Future.delayed(const Duration(seconds: 3), () {
               incrementOfjson();
             }) ;
           }

           }
         }

         }
        },
    );
  }
}
