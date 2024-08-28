import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(height: double.infinity,width: double.infinity,
    decoration: BoxDecoration(gradient: RadialGradient(colors: [Color.fromRGBO(240, 115, 254, 1),
    Color.fromRGBO(182, 119, 230, 1), Color.fromRGBO(47, 0, 102, 1),

    ])),

   child: null

    )
    );
  }
}
