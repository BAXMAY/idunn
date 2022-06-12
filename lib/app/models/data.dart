class Data {
  Data({
    required this.name,
    required this.img,
    required this.price,
    required this.people,
    required this.stars,
    required this.description,
    required this.location,
  });

  String name;
  String img;
  int price;
  int people;
  int stars;
  String description;
  String location;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        name: json['name'],
        img: json['img'],
        price: json['price'],
        people: json['people'],
        stars: json['stars'],
        description: json['description'],
        location: json['location']);
  }
}
