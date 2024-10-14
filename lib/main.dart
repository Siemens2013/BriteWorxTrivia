import 'package:briteworxtrivia/screens/quiz_model.dart';
import 'package:briteworxtrivia/screens/splash.dart';
import 'package:flutter/material.dart';

List<QuizModel> quizList = [];

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  quizList = await loadQuizzes();

  return runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}
