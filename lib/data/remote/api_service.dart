
import 'package:flutter_ujikom_test_2/model/news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class APIService {
  Future<List<News>> getNews() async{
    final String url = "https://63edd324d466e0c18ba3ed0f.mockapi.io/api/news";
    List<News> listData = [];
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var json = convert.jsonDecode(response.body);
      listData = List.from(json).map((e) => News.fromJson(e)).toList();

      return listData;
    } else {
      return [];
    }
  }
}