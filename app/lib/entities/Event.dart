class Event {
  final int id;
  final String title;
  final String local;
  final String date;
  final String imageUrl;

  Event({this.id, this.title, this.local, this.date, this.imageUrl});

  factory Event.fromJson(Map<String, dynamic> json) {
    String _parseDate(DateTime dateTime) {
      final year = dateTime.year;
      final month = dateTime.month.toString().padLeft(2, '0');
      final day = dateTime.day.toString().padLeft(2, '0');
      final hour = dateTime.hour.toString().padLeft(2, '0');
      final minute = dateTime.minute.toString().padLeft(2, '0');

      return '$day/$month/$year às $hour:$minute';
    }

    return Event(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      local: json['local'] ?? '',
      date: _parseDate(DateTime.parse(json['date']) ?? new DateTime.now()),
      imageUrl: "${json['image_url']}${json['id']}" ?? '',
    );
  }
}
