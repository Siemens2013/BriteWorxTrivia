import 'package:briteworxtrivia/main.dart';
import 'package:briteworxtrivia/rowedCategory.dart';
import 'package:flutter/material.dart';
import 'package:briteworxtrivia/selectCategory.dart';

class BriteWorxTrivia extends StatefulWidget {
  const BriteWorxTrivia({super.key});

  @override
  State<BriteWorxTrivia> createState() => _BriteWorxTriviaState();
}

class _BriteWorxTriviaState extends State<BriteWorxTrivia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Container(decoration: BoxDecoration(image:
      DecorationImage(image: AssetImage('assets/images/Screen.png'))),
        child: Container(decoration: BoxDecoration(image: DecorationImage(image:
        AssetImage('assets/images/Group 643.png'))),
          child: Center(
            child: Column(children: [

              FilledButton(onPressed: (){
               Navigator.push(context,
                   MaterialPageRoute(builder: (context) => RawedCategories()));

              },

                child: Text('Play!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),),
                style: FilledButton.styleFrom(backgroundColor: Colors.grey),
              ),
            ],
            ),
          ),
        ),
      ),
    );



  }
}
