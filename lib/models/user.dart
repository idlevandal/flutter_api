
class User {
  int id;
  String name;
  String userName;
  String email;
  String city;
  String phone;

  User({this.id, this.name, this.userName, this.email, this.city, this.phone});

  factory User.fromJson(Map<String, dynamic> jsonData) {
    return User(
      id: jsonData['id'],
      name: jsonData['name'],
      userName: jsonData['username'],
      email: jsonData['email'],
      city: jsonData['address']['city'],
      phone: jsonData['phone'],
    );
  }
}