import 'package:flutter/material.dart';
import 'package:news/screens/news_item.dart';
import 'package:news/shared/network/remote/api_manger.dart';

class NewsSearchDelegets extends SearchDelegate {  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
    IconButton(onPressed: (){
      showResults(context);
    },
        icon: Icon(Icons.search)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.of(context).pop();
    },
        icon: Icon(Icons.close));
  }
  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future:
      ApiManager.getSearchData(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ));

        }
        if (snapshot.hasError) {
          return Center(child: Text("Something Went Wrong"));
        }
        var articlesList = snapshot.data?.articles ?? [];
        if (articlesList.isEmpty) {
          return Center(child: Text("No Sources"));
        }
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) =>
                SizedBox(height: 12,),

            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: NewsItem(article: articlesList[index] ),
              );
            },
            itemCount: articlesList.length,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future:
      ApiManager.getSearchData(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ));

        }
        if (snapshot.hasError) {
          return Center(child: Text("Something Went Wrong"));
        }
        var articlesList = snapshot.data?.articles ?? [];
        if (articlesList.isEmpty) {
          return Center(child: Text("No Result"));
        }
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) =>
                SizedBox(height: 12,),

            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: NewsItem(article: articlesList[index] ),
              );
            },
            itemCount: articlesList.length,
          ),
        );
      },
    );
  }
}
