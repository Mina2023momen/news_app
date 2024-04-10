import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/NewsResponse.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class NewsDetails extends StatelessWidget {
  static const String routeName = "newsdetails";

  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute
        .of(context)!
        .settings
        .arguments as Articles;
    return Scaffold(
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
        title: Text(article.author??"",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
        body: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? "",
                  height: 250,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.source?.name ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      article.title ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      article.description ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Text(article.content??"",),
                   SizedBox(
                     height: 12,
                   ),
                   InkWell(
                     onTap: () {
                     launchNewsUrl(article.url??"");
                     },
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Text("View Full Article",style: TextStyle(
                             color: Colors.blue),),
                         Icon(Icons.arrow_forward_ios,color: Colors.blue),
                       ],
                     ),
                   ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
  Future<void> launchNewsUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
