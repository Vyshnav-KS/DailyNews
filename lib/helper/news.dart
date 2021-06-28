import 'dart:convert';
import 'package:news_app/secret.dart';
import 'package:news_app/models/articleModel.dart';
import 'package:http/http.dart' as http;

class News{

  List<ArticleModel> news = [];
  
  Future<void> getData() async{

    String url = "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=$apiKey";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if(jsonData['status']== "ok"){

      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){

          ArticleModel articleModel =ArticleModel(
            author: element['author'], 
            title: element['title'], 
            description: element['description'], 
            articleUrl: element['url'], 
            urlToImage: element['urlToImage'],
           // publishedAt: element["publishedAt"],  
            content: element['content'],
            );

          news.add(articleModel);

        }
      });

    }

  }

}

class CategoryNewsClass{

  List<ArticleModel> news = [];
  
  Future<void> getData(String category) async{

    String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$apiKey";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if(jsonData['status']== "ok"){

      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){

          ArticleModel articleModel =ArticleModel(
            author: element['author'], 
            title: element['title'], 
            description: element['description'], 
            articleUrl: element['url'], 
            urlToImage: element['urlToImage'],
           // publishedAt: element["publishedAt"],  
            content: element['content'],
            );

          news.add(articleModel);

        }
      });

    }

  }

}