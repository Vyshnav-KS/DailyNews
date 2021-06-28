import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/articleModel.dart';
import 'package:news_app/views/article.dart';
import 'package:news_app/views/home.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CategoryNews extends StatefulWidget {

  final String category;

  CategoryNews({required this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WebView.platform = SurfaceAndroidWebView();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass classNews = CategoryNewsClass();
    await classNews.getData(widget.category);
    articles = classNews.news;
    //print(articles);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [  
          //Text('Daily'),
          Text(widget.category.toUpperCase(),
          style: TextStyle(color: Colors.black54,
          fontSize: 16),),
        ],),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(padding: EdgeInsets.symmetric(horizontal: 16), child: Icon(Icons.ac_unit)))
        ],
        centerTitle: true,
        elevation: 0.35,
      ),
      body:_loading ? Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CircularProgressIndicator(
            color: Colors.red[700],
          ),//true part
        ),
      ) : SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Container(
                padding: EdgeInsets.all(15),
                child: ListView.builder(
                  //scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: articles.length,
                  itemBuilder: (context, index){
                    return BlogTile(imageUrl: articles[index].urlToImage,
                     title: articles[index].title,
                      desc: articles[index].description,
                      url: articles[index].articleUrl,
                      );
                  }  
                ),
                
              ),
          ],),
        ),
      ),
    );
  }
}