class Event {
  final int id;
  final String title;
  final String local;
  final DateTime date;
  final String imageUrl;

  Event({this.id, this.title, this.local, this.date, this.imageUrl});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      local: json['local'] ?? '',
      date: DateTime.parse(json['date']) ?? new DateTime.now(),
      imageUrl: json['image_url'] ?? '',
    );
  }
}
