import 'package:briteworxtrivia/main.dart';
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
      backgroundColor: Colors.white,
      body:
      Center(
        child: Column(children: [
          SizedBox(height: 35),
          Text('BRITEWORX', style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),),
          Text('TRIVIA!', style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),),
          SizedBox(height: 8),
          FilledButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => SelectCategory()));

          },

            child: Text('Play!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),),
            style: FilledButton.styleFrom(backgroundColor: Colors.grey),
          ),
        ],
        ),
      ),
    );



  }
}
