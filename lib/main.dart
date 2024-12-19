import 'package:briteworxtrivia/screens/game_category_selection_screen.dart';
import 'package:briteworxtrivia/screens/quiz_model.dart';
import 'package:briteworxtrivia/screens/quiz_screen.dart';
import 'package:briteworxtrivia/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:briteworxtrivia/screens/screen_definer.dart';
double vrt=28, hrzn=48, wdth=400, hght=100, hght1=16;
double fntSize=50, fntSizeTxt=48, fntQzSlc=50, fntSizeQzTlt=44;
double fntVariant=32, fntSizeTitle=24;
double extBttnSze=60;
double pixelRatio=0;
double sz=4;  //quiz_screen.dart   #136 Adjust yellow boxes
double hght2=60; // quiz_screen.dart #64 height of yellow boxes with answers 4 pcs
double wdth1=280; //quiz_screen.dart #248 the width of Answer button
double wdth2=50; //quiz_screen.dart #299 the width of NEXT button
List<QuizModel> quizList = [];

void main() async {
   //pixelRatio = MediaQuery.of(context).devicePixelRatio;
  WidgetsFlutterBinding.ensureInitialized();

  quizList = await loadQuizzes();

  return runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:

      ScreenDefiner(),
      //GameCategorySelectionScreen(),
      //SplashScreen(),
    ),
  );
}
