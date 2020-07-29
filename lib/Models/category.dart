class Gategory {
  int id;
  String name;

  Gategory(int id, String name) {
    this.id = id;
    this.name = name;
  }

  factory Gategory.fromJson(Map<String, dynamic> json) {
    return Gategory(json['id'] as int, json['name'] as String);
  }
}
