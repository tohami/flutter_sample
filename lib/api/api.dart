import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sample_one/model/news_item.dart';

const String BASE_URL = "https://egyptinnovate.com/en/api/v01" ;

Future<http.Response> httpGet(String path) {
  return http.get(BASE_URL + path);
}

Future<List<NewsItem>> getNewsList() async {
  //get the json from api
  http.Response newsListApiResponse = await httpGet("/safe/GetNews") ;

  var newsListJson = json.decode(newsListApiResponse.body) ;

  //parse the json
  var newsList = new List<NewsItem>();
  if (newsListJson['News'] != null) {
    newsListJson['News'].forEach((item) {
      newsList.add(new NewsItem.fromJson(item));
    });
  }
//  return the list
  return newsList ;
}