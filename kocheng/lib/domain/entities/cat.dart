import 'dart:convert';

class Cat {
  Cat({
    this.breeds,
    this.categories,
    this.id,
    this.url,
    this.width,
    this.height,
  });

  List<dynamic> breeds;
  List<Category> categories;
  String id;
  String url;
  int width;
  int height;

  factory Cat.fromJson(String str) => Cat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cat.fromMap(Map<String, dynamic> json) => Cat(
    breeds: List<dynamic>.from(json["breeds"].map((x) => x)),
    categories: List<Category>.from(json["categories"].map((x) => Category.fromMap(x))),
    id: json["id"],
    url: json["url"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toMap() => {
    "breeds": List<dynamic>.from(breeds.map((x) => x)),
    "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
    "id": id,
    "url": url,
    "width": width,
    "height": height,
  };
}

class Category {
  Category({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
  };
}
