import 'package:briteworxtrivia/screens/constants.dart';
import 'package:briteworxtrivia/screens/quiz_screen.dart';
import 'package:dpad_container/dpad_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';

class QuizSelectionScreen extends StatefulWidget {
  final String categoryTitle;

  const QuizSelectionScreen({super.key, required this.categoryTitle});

  @override
  State<QuizSelectionScreen> createState() => _QuizSelectionScreenState();
}

class _QuizSelectionScreenState extends State<QuizSelectionScreen> {
  List<String> quizzes = [];
  int focusedQuizIndex = -1;

  @override
  void initState() {
    quizzes = quizList
        .where((quiz) => quiz.category == widget.categoryTitle)
        .map((quiz) => quiz.quizTitle)
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBg,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: Container()),
                Text(
                  widget.categoryTitle,
                  style: const TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: DpadContainer(
                        onClick: () {
                          Navigator.of(context).pop();
                        },
                        onFocus: (bool isFocused) {
                          setState(() {
                            focusedQuizIndex = 0;
                          });
                        },
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: focusedQuizIndex == 0
                                  ? Border.all(color: Colors.white, width: 2)
                                  : null,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SvgPicture.asset('assets/exitButton.svg',
                                  height: 60),
                            )),
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Stack(
              children: [
                SvgPicture.asset("assets/bigShinyBackground.svg"),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 48, vertical: 28),
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Two columns
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 4, // Adjust as needed
                    ),
                    itemCount: quizzes.length,
                    itemBuilder: (context, index) {
                      return DpadContainer(
                          onClick: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => QuizScreen(
                                    quiz: quizList.firstWhere((quiz) =>
                                    quiz.category ==
                                        widget.categoryTitle &&
                                        quiz.quizTitle == quizzes[index])),
                              ),
                            );
                          },
                          onFocus: (bool isFocused) {
                            setState(() {
                              focusedQuizIndex = isFocused ? index + 1 : -1;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: focusedQuizIndex == index + 1
                                  ? Border.all(color: Colors.white, width: 3)
                                  : null,
                            ),
                            child: Stack(
                              children: [
                                SvgPicture.asset(
                                    "assets/categoryButtonBackground.svg"),
                                Center(
                                  child: Text(
                                    quizzes[index],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 38,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ],
                            ),
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
