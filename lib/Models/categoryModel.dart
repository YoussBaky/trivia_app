class CategoryClass {
  int id;
  String name;

  CategoryClass(int id, String name) {
    this.id = id;
    this.name = name.replaceAll('Entertainment: ', '');
  }

  factory CategoryClass.fromJson(Map<String, dynamic> json) {
    return CategoryClass(json['id'] as int, json['name']);
  }
}
