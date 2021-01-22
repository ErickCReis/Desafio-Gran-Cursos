import 'package:app/models/News.dart';
import 'package:app/services/list_news_service.dart';
import 'package:flutter/material.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List<News> news;

  @override
  void initState() {
    super.initState();
    _pullRefresh();
  }

  Future<void> _pullRefresh() async {
    final newsData = await listNewsService();
    setState(() {
      news = newsData as List<News>;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _pullRefresh,
      child: news == null
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(news[index].title),
                  subtitle: Text(news[index].content),
                );
              },
            ),
    );
  }
}
