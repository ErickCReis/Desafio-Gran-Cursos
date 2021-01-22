import 'package:flutter/material.dart';

import 'package:app/entities/News.dart';
import 'package:app/services/list_news_service.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  dynamic news;

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

  Widget _eventList() {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(news[index].title),
          subtitle: Text(news[index].content),
        );
      },
    );
  }

  Widget _verifyResponse() {
    return news == null
        ? CircularProgressIndicator()
        : (news is List<News> && news.isNotEmpty)
            ? _eventList()
            : Text("Nenhuma notícia encontrado");
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(onRefresh: _pullRefresh, child: _verifyResponse());
  }
}
