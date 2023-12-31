class DataModel {
  String name;
  String img;
  int price;
  int people;
  int stars;
  String description;
  String location;

  DataModel({
    required this.name,
    required this.img,
    required this.price,
    required this.people,
    required this.stars,
    required this.description,
    required this.location,
  });

  factory DataModel.fromJson(Map<String, dynamic> jsonData) {
    return DataModel(
        name: jsonData["name"],
        img: jsonData["img"],
        price: jsonData["price"],
        people: jsonData["people"],
        stars: jsonData["stars"],
        description: jsonData["description"],
        location: jsonData["location"]);
  }
}
