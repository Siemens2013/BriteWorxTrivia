import 'dart:convert';

import 'package:flutter/services.dart';

class QuizModel {
  String category;
  String quizTitle;
  List<Question> questions;

  QuizModel({required this.category, required this.quizTitle, required this.questions});

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    var list = json['questions'] as List;
    List<Question> questionList = list.map((i) => Question.fromJson(i)).toList();

    return QuizModel(
      category: json['category'],
      quizTitle: json['quizTitle'],
      questions: questionList,
    );
  }
}

class Question {
  String questionTitle;
  List<String> answers;
  int correctAnswerIndex;

  Question({required this.questionTitle, required this.answers, required this.correctAnswerIndex});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionTitle: json['questionTitle'],
      answers: List<String>.from(json['answers']),
      correctAnswerIndex: json['correctAnswerIndex'],
    );
  }
}

Future<List<QuizModel>> loadQuizzes() async {
  List<QuizModel> quizzes = [];

  final manifestContent = await rootBundle.loadString('AssetManifest.json');
  final Map<String, dynamic> manifestMap = json.decode(manifestContent);

  final quizFiles = manifestMap.keys
      .where((key) => key.startsWith('assets/quizzes/') && key.endsWith('.json'))
      .toList();

  for (String filePath in quizFiles) {
    String jsonString = await rootBundle.loadString(filePath);
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    QuizModel quiz = QuizModel.fromJson(jsonMap);
    quizzes.add(quiz);
  }

  return quizzes;
}