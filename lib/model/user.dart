class User {
  User({
    this.id,
    this.username,
    this.email,
    this.nik,
    this.password,
  });

  int? id;
  String? username;
  String? email;
  String? nik;
  String? password;

  factory User.fromSqfliteDatabase(Map<String, dynamic> map)=>User(
    id: map['id']?.toInt() ?? 0,
    username: map['username'] ?? '',
  );

}
