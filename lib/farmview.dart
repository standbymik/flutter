class Farmview {
  final int userId;
  final int id;
  final String title;
  final String body;

  Farmview({this.userId, this.id, this.title, this.body});

  factory Farmview.fromJson(Map<String, dynamic> json) {
    return Farmview(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
