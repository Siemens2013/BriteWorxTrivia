
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:briteworxtrivia/briteWorxTrivia.dart';
import 'package:briteworxtrivia/rowedCategory2.dart';

class ScrollableContainer extends StatefulWidget {
  const ScrollableContainer({super.key});

  @override
  State<ScrollableContainer> createState() => _ScrollableContainerState();
}

class _ScrollableContainerState extends State<ScrollableContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SCROLLABLE CONTAINER'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,),
        body:
            Scrollbar(thumbVisibility: true,
              scrollbarOrientation: ScrollbarOrientation.right,
              interactive: true, radius: Radius.elliptical(10, 10),

              child: SingleChildScrollView(scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(height: 50, width: 400, color: Colors.grey,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(height: 50, width: 400, color: Colors.grey,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(height: 50, width: 400, color: Colors.grey,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(height: 50, width: 400, color: Colors.grey,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(height: 50, width: 250, color: Colors.grey,),
                    )
                  ],
                ),
              ),
            )



    );
  }
}
