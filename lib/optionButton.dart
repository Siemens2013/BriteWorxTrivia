import 'dart:io';

import 'package:briteworxtrivia/GameTitle.dart';
import 'package:flutter/cupertino.dart';
int indexJson=0;

class Optionbutton extends StatefulWidget {
 final String assetPath;
 final String jsonOption;
  int choice1=0;
   Optionbutton({super.key, required this.assetPath, required this.jsonOption, required this.choice1});

  @override
  State<Optionbutton> createState() => _OptionbuttonState();
}
void incrementOfjson(){
  if (indexJson<= lengthJson-2) {
    indexJson = indexJson + 1;
  }
  else {
    indexJson=0;
  }
}
class _OptionbuttonState extends State<Optionbutton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(height: 23,width: 120,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(widget.assetPath),
          fit: BoxFit.cover,
        ),
            borderRadius: BorderRadius.circular(5)),
        child: Text(widget.jsonOption,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14 ), textAlign: TextAlign.left,),
      ),
      onTap: (){ incrementOfjson(); print(widget.choice1); },
    );
  }
}
