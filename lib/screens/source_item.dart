import 'package:flutter/material.dart';
import 'package:news/models/source_resposne.dart';

class SourceItem extends StatelessWidget {
  Sources source;
  bool isSelected;
  SourceItem({super.key,required this.source,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 3),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.green),
          color: isSelected?Colors.green:Colors.transparent,
        ),
        child: Text(source.name??"",style: TextStyle(
          color: isSelected?Colors.white:Colors.green
        ),),
      ),
    );
  }
}
