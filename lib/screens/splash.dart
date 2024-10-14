import 'package:briteworxtrivia/screens/game_category_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const GameCategorySelectionScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox.expand(
      child: SvgPicture.asset(
        'assets/splashScreen.svg',
        fit: BoxFit.cover,
      ),
    );
  }
}

