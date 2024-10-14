import 'package:briteworxtrivia/screens/quiz_model.dart';
import 'package:briteworxtrivia/screens/quiz_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dpad_container/dpad_container.dart';

import '../main.dart';
import 'constants.dart';

class GameCategorySelectionScreen extends StatefulWidget {
  const GameCategorySelectionScreen({super.key});

  @override
  State<GameCategorySelectionScreen> createState() => _GameCategorySelectionScreenState();
}

class _GameCategorySelectionScreenState extends State<GameCategorySelectionScreen> {

  List<String> gameCategories = [];
  int focusedIndex = -1;

  @override
  void initState() {
    for (QuizModel quiz in quizList) {
      gameCategories.add(quiz.category);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBg,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "SELECT A CATEGORY",
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Stack(
              children: [
                SvgPicture.asset("assets/bigShinyBackground.svg"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 28),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Two columns
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 4, // Adjust as needed
                    ),
                    itemCount: gameCategories.length,
                    itemBuilder: (context, index) {
                      return DpadContainer(
                        onClick: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => QuizSelectionScreen(categoryTitle: gameCategories[index]),
                            ),
                          );
                        },
                        onFocus: (bool isFocused) {
                          setState(() {
                            focusedIndex = isFocused ? index : -1;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: focusedIndex == index
                                ? Border.all(color: Colors.white, width: 3)
                                : null,
                          ),
                          child: Stack(
                            children: [
                              SvgPicture.asset("assets/categoryButtonBackground.svg"),
                              Center(
                                child: Text(
                                  gameCategories[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 38,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
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
