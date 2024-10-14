import 'dart:ui';

import 'package:briteworxtrivia/screens/constants.dart';
import 'package:briteworxtrivia/screens/quiz_model.dart';
import 'package:dpad_container/dpad_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuizScreen extends StatefulWidget {
  final QuizModel quiz;

  const QuizScreen({super.key, required this.quiz});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionIndex = 0;
  bool answered = false;
  bool showExitPopUp = false;
  bool gameOver = false;

  int mainFocusedIndex = -1;
  int exitPopupFocusedIndex = -1;
  int gameOverFocusedIndex = -1;

  Widget buildAnswerChoice(
      String choice, int choiceIndex, int correctChoice) {
    return Expanded(
      child: DpadContainer(
        onClick: () {
          if (!answered) {
            setState(() {
              answered = true;
            });
          }
        },
        onFocus: (bool isFocused) {
          if (isFocused) {
            setState(() {
              mainFocusedIndex = choiceIndex;
            });
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: mainFocusedIndex == choiceIndex
                ? Border.all(color: Colors.white, width: 3)
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                color: (answered && choiceIndex == correctChoice)
                    ? answerChoiceCorrectBg
                    : answerChoiceNeutralBg,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 60,
              child: Center(
                child: Text(
                  choice,
                  style:
                  TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPlaceholderImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SvgPicture.asset(
        'assets/quizImagePlaceholder.svg',
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: appBg,
        body: Stack(
          children: [
            // Wrap main content and exit button in the same FocusScope
            if (!showExitPopUp && !gameOver)
              FocusScope(
                child: Stack(
                  children: [
                    // Main Content
                    Positioned(
                      bottom: 32,
                      right: 0,
                      left: 0,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Stack(
                          children: [
                            SvgPicture.asset(
                                "assets/bigShinyBackground.svg"),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 56, vertical: 24),
                              child: Row(
                                children: [
                                  Flexible(
                                      flex: 1,
                                      child: buildPlaceholderImage()),
                                  const SizedBox(width: 8),
                                  Flexible(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: questionBg,
                                            borderRadius:
                                            BorderRadius.circular(20),
                                          ),
                                          height: MediaQuery.of(context)
                                              .size
                                              .height /
                                              4,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                widget
                                                    .quiz
                                                    .questions[questionIndex]
                                                    .questionTitle,
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight:
                                                    FontWeight.w900,
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          children: [
                                            buildAnswerChoice(
                                                widget
                                                    .quiz
                                                    .questions[questionIndex]
                                                    .answers[0],
                                                0,
                                                widget
                                                    .quiz
                                                    .questions[questionIndex]
                                                    .correctAnswerIndex),
                                            const SizedBox(width: 8),
                                            buildAnswerChoice(
                                                widget
                                                    .quiz
                                                    .questions[questionIndex]
                                                    .answers[1],
                                                1,
                                                widget
                                                    .quiz
                                                    .questions[questionIndex]
                                                    .correctAnswerIndex),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            buildAnswerChoice(
                                                widget
                                                    .quiz
                                                    .questions[questionIndex]
                                                    .answers[2],
                                                2,
                                                widget
                                                    .quiz
                                                    .questions[questionIndex]
                                                    .correctAnswerIndex),
                                            const SizedBox(width: 8),
                                            buildAnswerChoice(
                                                widget
                                                    .quiz
                                                    .questions[questionIndex]
                                                    .answers[3],
                                                3,
                                                widget
                                                    .quiz
                                                    .questions[questionIndex]
                                                    .correctAnswerIndex),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        SizedBox(
                                          height: 75,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              DpadContainer(
                                                  onClick: () {
                                                    setState(() {
                                                      answered = true;
                                                    });
                                                  },
                                                  onFocus: (bool isFocused) {
                                                    if (isFocused) {
                                                      setState(() {
                                                        mainFocusedIndex = 4;
                                                      });
                                                    }
                                                  },
                                                  child: AnimatedContainer(
                                                      duration: const Duration(
                                                          milliseconds: 200),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(16),
                                                        border: mainFocusedIndex ==
                                                            4
                                                            ? Border.all(
                                                            color: Colors
                                                                .white,
                                                            width: 2)
                                                            : null,
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: SvgPicture.asset(
                                                          'assets/showAnswerButton${answered ? 'Disabled' : 'Enabled'}.svg',
                                                          width: 275,
                                                        ),
                                                      ))),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              DpadContainer(
                                                  onClick: () {
                                                    setState(() {
                                                      if (questionIndex ==
                                                          widget.quiz.questions
                                                              .length -
                                                              1) {
                                                        setState(() {
                                                          gameOver = true;
                                                        });
                                                        return;
                                                      }

                                                      if (answered) {
                                                        questionIndex++;
                                                        answered = false;
                                                      }
                                                    });
                                                  },
                                                  onFocus: (bool isFocused) {
                                                    if (isFocused) {
                                                      setState(() {
                                                        mainFocusedIndex = 5;
                                                      });
                                                    }
                                                  },
                                                  child: AnimatedContainer(
                                                      duration: const Duration(
                                                          milliseconds: 200),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(12),
                                                        border: mainFocusedIndex ==
                                                            5
                                                            ? Border.all(
                                                            color: Colors
                                                                .white,
                                                            width: 2)
                                                            : null,
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: SvgPicture.asset(
                                                          'assets/nextButton${answered ? 'Enabled' : 'Disabled'}.svg',
                                                          width: 50,
                                                        ),
                                                      ))),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Quiz Title
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 400,
                            height: 100,
                            child: Center(
                              child: Stack(
                                children: [
                                  SvgPicture.asset(
                                      'assets/quizTitleBackground.svg'),
                                  Center(
                                    child: Text(
                                      widget.quiz.quizTitle,
                                      style: const TextStyle(
                                        fontSize: 50,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Exit Button
                    Positioned(
                      top: 8,
                      right: 8,
                      child: DpadContainer(
                        onClick: () {
                          setState(() {
                            showExitPopUp = true;
                            // Reset main focused index
                            mainFocusedIndex = -1;
                          });
                        },
                        onFocus: (bool isFocused) {
                          if (isFocused) {
                            setState(() {
                              mainFocusedIndex = 6;
                            });
                          }
                        },
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: mainFocusedIndex == 6
                                  ? Border.all(color: Colors.white, width: 2)
                                  : null,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: SvgPicture.asset('assets/exitButton.svg',
                                  height: 60),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            // Exit Confirmation Pop-up
            if (showExitPopUp)
              FocusScope(
                autofocus: true,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 8.0,
                    sigmaY: 8.0,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    child: SizedBox(
                      height:
                      MediaQuery.of(context).size.height * 0.75,
                      width: 450,
                      child: Center(
                        child: Stack(
                          children: [
                            SvgPicture.asset('assets/exitBackground.svg'),
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 48.0, vertical: 32),
                                  child: Text(
                                    "Are you sure you want to quit?",
                                    style: TextStyle(
                                        fontSize: 42,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                DpadContainer(
                                    onClick: () {
                                      Navigator.of(context).pop();
                                    },
                                    onFocus: (bool isFocused) {
                                      if (isFocused) {
                                        setState(() {
                                          exitPopupFocusedIndex = 0;
                                        });
                                      }
                                    },
                                    child: AnimatedContainer(
                                        duration: const Duration(
                                            milliseconds: 200),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          border: exitPopupFocusedIndex == 0
                                              ? Border.all(
                                              color: Colors.white,
                                              width: 5)
                                              : null,
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/yesButton.svg',
                                          height: 75,
                                        ))),
                                const SizedBox(
                                  height: 8,
                                ),
                                DpadContainer(
                                    onClick: () {
                                      setState(() {
                                        showExitPopUp = false;
                                        exitPopupFocusedIndex = -1;
                                      });
                                    },
                                    onFocus: (bool isFocused) {
                                      if (isFocused) {
                                        setState(() {
                                          exitPopupFocusedIndex = 1;
                                        });
                                      }
                                    },
                                    child: AnimatedContainer(
                                        duration: const Duration(
                                            milliseconds: 200),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          border: exitPopupFocusedIndex == 1
                                              ? Border.all(
                                              color: Colors.white,
                                              width: 5)
                                              : null,
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/noButton.svg',
                                          height: 75,
                                        ))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            // Game Over Screen
            if (gameOver)
              FocusScope(
                autofocus: true,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 24.0,
                    sigmaY: 24.0,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "GAME OVER",
                          style: TextStyle(
                              fontSize: 75,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DpadContainer(
                                onClick: () {
                                  Navigator.of(context).pop();
                                },
                                onFocus: (bool isFocused) {
                                  if (isFocused) {
                                    setState(() {
                                      gameOverFocusedIndex = 0;
                                    });
                                  }
                                },
                                child: AnimatedContainer(
                                    duration: const Duration(
                                        milliseconds: 200),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(20),
                                      border: gameOverFocusedIndex == 0
                                          ? Border.all(
                                          color: Colors.white,
                                          width: 5)
                                          : null,
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/newGameButton.svg',
                                      height: 75,
                                    ))),
                            const SizedBox(
                              width: 16,
                            ),
                            DpadContainer(
                                onClick: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                                onFocus: (bool isFocused) {
                                  if (isFocused) {
                                    setState(() {
                                      gameOverFocusedIndex = 1;
                                    });
                                  }
                                },
                                child: AnimatedContainer(
                                    duration: const Duration(
                                        milliseconds: 200),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(20),
                                      border: gameOverFocusedIndex == 1
                                          ? Border.all(
                                          color: Colors.white,
                                          width: 5)
                                          : null,
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/backToCategoriesButton.svg',
                                      height: 75,
                                    ))),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
