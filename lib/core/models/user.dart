class User {
  String? userId;
  String? email;
  String? name;
  int? age;

  User();

  User.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        email = json['email'];

  Map<String, dynamic> toJson() =>
      {'name': name, 'age': age, 'email': email, 'userId': userId};
}
