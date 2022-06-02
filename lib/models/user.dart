class User {
  String id;
  String name;
  String? password;

  User({required this.id, required this.name, this.password});

  factory User.fromJson(Map json) {
    return User(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
