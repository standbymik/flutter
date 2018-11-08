class Farmview {
  final String image;
  final String farm;
  final String body;

  Farmview({this.image,this.farm, this.body});

  factory Farmview.fromJson(Map<String, dynamic> json) {
    return Farmview(
      image:json['image'],
      farm:json['name'],
      body: json['body'],
    );
  }
}
