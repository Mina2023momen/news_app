import 'package:flutter/material.dart';
import 'package:news/screens/category_tab.dart';
import 'package:news/screens/data_tab.dart';
import 'package:news/search_delegets.dart';

import '../models/category_model.dart';
import '../screens/drawer_widget.dart';
import '../screens/news_tab.dart';
import '../shared/network/remote/api_manger.dart';

class homeScreen extends StatefulWidget {

   homeScreen({super.key});
  static const String routeName="HomeScreen";

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage("assets/images/pattern.png"))
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: DrawerWidget(onClick: onDrawerClicked),
        appBar: AppBar(
          actionsIconTheme: IconThemeData.fallback(),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.green,
          centerTitle: true,
          shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),   bottomLeft: Radius.circular(20),
            )
          ),
          title: Text("news",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      actions: [
        IconButton(onPressed: (){
          showSearch(context: context, delegate: NewsSearchDelegets());
        }, icon: Icon(Icons.search,size: 30,))
      ],
        ),
        body:selectedCategory==null?
        CategoryTab(onClick:onCategoryClicked):DataTab(
          categoryId: selectedCategory!.id
        ),
      ),
    );
  }

  CategoryModel? selectedCategory;

  onCategoryClicked(category){
 selectedCategory= category;
 setState(() {

 });
  }
  onDrawerClicked(id){
    if (id==DrawerWidget.CATEGORY_ID){
   selectedCategory=null;
   Navigator.pop(context);
   setState(() {

   });
    }else if (id==DrawerWidget.SETTINGS_ID){}
  }
}
