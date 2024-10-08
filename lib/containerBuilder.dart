
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerBuilder extends StatefulWidget {
  final double hght;
  final double wdth;
  final String txt;
  final double fntSize;
  int i1=0;
   ContainerBuilder({ required this.hght, required this.wdth,
     required this.txt, required this.fntSize});


  @override

  State<ContainerBuilder> createState() => _ContainerBuilderState();
}

class _ContainerBuilderState extends State<ContainerBuilder> {
  void increment_index(){
   setState(() {
     widget.i1++;
   });

  }
  @override
  void initState() {
    increment_index();
    super.initState();
  }
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 100, 0),
        child: Container(decoration: BoxDecoration(image: DecorationImage(image:
        AssetImage('assets/images/Knopka.png'))),
          height: widget.hght,width: widget.wdth,
         child: Center(child: Text(widget.txt,
                style: TextStyle(fontSize: widget.fntSize,
                    color: Colors.white),)),
        ),
      );

              //increment_index();
  }
}
