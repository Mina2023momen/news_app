import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:news/models/source_resposne.dart';

import '../../../models/NewsResponse.dart';
import '../../components/constants.dart';

class ApiManager {
  //https://newsapi.org/v2/top-headlines/sources?apikey=924a4b7b966a4cf6ae4fbad5a8e9fcfe
static Future<SourceResponse>getSources(String category)async{
  Uri url =Uri.https(Constants.BASE_URL,"/v2/top-headlines/sources" ,{
    "apikey":"924a4b7b966a4cf6ae4fbad5a8e9fcfe","category":category
  });
http.Response resposne=await http.get(url);
Map<String,dynamic> json =jsonDecode(resposne.body);

return SourceResponse.fromJson(json);
}


static Future<NewsResponse> getNewsData(String sourceId)async{

  Uri url=
  Uri.https(Constants.BASE_URL,"/v2/everything",{
    "sources":sourceId});
  var resposne =await http.get(url,headers:{"x-api-key":"924a4b7b966a4cf6ae4fbad5a8e9fcfe"} );
var json=jsonDecode(resposne.body);
  print("_______________________________>${resposne.body}");
return NewsResponse.fromJson(json);
  }
static Future<NewsResponse> getSearchData(String quary)async{

  Uri url=
  Uri.https(Constants.BASE_URL,"/v2/everything",{
    "q":quary});
  var resposne =await http.get(url,headers:{"x-api-key":"924a4b7b966a4cf6ae4fbad5a8e9fcfe"} );
  var json=jsonDecode(resposne.body);
  print("_______________________________>${resposne.body}");
  return NewsResponse.fromJson(json);
}
}