class News {
  final int id;
  final String title;
  final String content;
  final String imageUrl;

  News({this.id, this.title, this.content, this.imageUrl});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      imageUrl: json['image_url'] as String,
    );
  }
}
