import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/articleModel.dart';
import 'package:news_app/models/categoryModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/views/article.dart';
import 'package:news_app/views/category.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WebView.platform = SurfaceAndroidWebView();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News classNews = News();
    await classNews.getData();
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
          Text('Daily'),
          Text('News',
          style: TextStyle(color: Colors.red[700]),),
        ],),
        centerTitle: true,
        elevation: 0.35,
      ),
      body: _loading ? Center(
        child: Container(
          
          child: CircularProgressIndicator(
            color: Colors.red[700],
          ),//true part
        ),
      ) ://false part
      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              //categories
            Container(
              height: 70,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index){
                  return CategoryTile(
                     imageUrl: categories[index].imageUrl,
                     categoryName: categories[index].categoryName,
                  );
                }),
            ),
      
            //news blogs
      
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
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


//Categories on top

class CategoryTile extends StatelessWidget {

  final imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=> CategoryNews(category: categoryName.toString().toLowerCase())
        ),);
      },
      child: Container(
        
        margin: EdgeInsets.only(right: 15),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              
              child: CachedNetworkImage(
                imageUrl: imageUrl, 
                width: 160,
                height: 80,
                fit: BoxFit.cover,
                ),
            ),
            Container(
              alignment: Alignment.center,
              width: 160,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


//News Blog tiles

class BlogTile extends StatelessWidget {
  
final String imageUrl, title, desc, url;
BlogTile({required this.imageUrl, required this.title, required this.desc, required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder:(context)=> ArticleView(
            blogUrl: url,
          ),
          ),
          );
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(imageUrl
              )
              ),
            
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
              ),
              child: Column(children: [
                Text(title,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
            ),
            SizedBox(height: 5,),
            Text(desc,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15
            ),),
            SizedBox(height: 15,),
              ],),
            )
            
          ],
          
        ),
        margin: EdgeInsets.only(bottom: 20),
        
      ),
    );
  }
}