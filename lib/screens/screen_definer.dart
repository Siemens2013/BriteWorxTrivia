import 'package:briteworxtrivia/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:briteworxtrivia/main.dart';
import 'package:briteworxtrivia/screens/game_category_selection_screen.dart';
class ScreenDefiner extends StatefulWidget {

  const ScreenDefiner({super.key});

  @override
  State<ScreenDefiner> createState() => _ScreenDefinerState();
}

class _ScreenDefinerState extends State<ScreenDefiner> {
  @override

  @override
  Widget build(BuildContext context) {

      pixelRatio=MediaQuery.of(context).devicePixelRatio;
      if (pixelRatio==4){
        fntSize=26;
        hrzn=28;
        vrt=8;
        fntSizeTxt=28;
        fntQzSlc=28;    //quiz_selection_screen.dart #45 "CELEBRITIES font size"
        extBttnSze=32;  //quiz_selection_screen.dart #73 "EXIT Button" also quiz_screen.dart Line#378
        fntSizeQzTlt=22; //quiz_selection_screen.dart #134 "Quiz Title Font Size" also quiz_screen.dart #335
        fntVariant=16;    //quiz_screen.dart #68
        wdth=180; hght=50; //quiz_screen.dart #324 #325
        fntSizeTitle=16; // quiz_screen.dart #146 "example: WHEN did WWI end?"
        hght1=6; //quiz_screen.dart #155 "Size between question and answer choices"
        sz=8;  //quiz_screen.dart   #136 Adjust yellow boxes
        hght2=28; // quiz_screen.dart #64 height of yellow boxes with answers 4 pcs
        wdth1=160; //quiz_screen.dart #248 the width of Answer button
        wdth2=35; //quiz_screen.dart #299 the width of NEXT button
        return SplashScreen();
      }
      return SplashScreen();

    //return const Placeholder(

    //);
  }
}
