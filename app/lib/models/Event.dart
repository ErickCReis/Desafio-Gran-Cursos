class Event {
  final int id;
  final String title;
  final String content;
  final String imageUrl;

  Event({this.id, this.title, this.content, this.imageUrl});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      imageUrl: json['image_url'] as String,
    );
  }
}
