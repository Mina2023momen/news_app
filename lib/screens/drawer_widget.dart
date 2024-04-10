import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  Function onClick;
   DrawerWidget({required this.onClick,super.key});
  static const CATEGORY_ID=1;
  static const SETTINGS_ID=2;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width:MediaQuery.of(context).size.width*70 ,
      child: Column(
        children: [
         Container(
                height: 150,
           width: double.infinity,
           color: Colors.green,
           alignment: Alignment.center,
           child: Text("News App",style: TextStyle(fontSize: 30,color: Colors.white),),
         ),
          SizedBox(height: 20,),
          InkWell(
            onTap: () {
            onClick(CATEGORY_ID);
            },
            child: Row(
              children: [
                Icon(Icons.list,size: 30,),
                SizedBox(width: 20,),
                Text("Categories",style: TextStyle(fontSize: 22),)
              ],
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: () {
          onClick(SETTINGS_ID);
            },
            child: Row(
              children: [
                Icon(Icons.settings,size: 30,),
                SizedBox(width: 20,),
                Text("Settings",style: TextStyle(fontSize: 22),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
