import 'package:flutter/material.dart';

import 'package:app/entities/News.dart';
import 'package:app/services/list_news_service.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  dynamic news;

  final titleTextStyle =
      TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold);

  final contentTextStyle = TextStyle(color: Colors.white);

  @override
  void initState() {
    super.initState();
    _pullRefresh();
  }

  Future _pullRefresh() async {
    final newsData = await listNewsService();
    setState(() {
      news = newsData;
    });
  }

  Widget _newsCard(News _news) {
    return SizedBox(
      height: 250,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(fit: StackFit.passthrough, children: [
          Image.network(_news.imageUrl, fit: BoxFit.fill),
          Container(color: Colors.black54),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _news.title,
                  style: titleTextStyle,
                ),
                Text(
                  _news.content,
                  style: contentTextStyle,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
      ),
    );
  }

  Widget _newsList(List<News> _newsList) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        return _newsCard(_newsList[index]);
      },
    );
  }

  Widget _verifyResponse() {
    return news == null
        ? CircularProgressIndicator()
        : (news is List<News> && news.isNotEmpty)
            ? _newsList(news)
            : Text("Nenhuma notícia encontrada");
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(onRefresh: _pullRefresh, child: _verifyResponse());
  }
}
