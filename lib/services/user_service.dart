import 'package:http/http.dart';
import 'package:practice_api/models/user.dart';
import 'dart:convert';
import 'dart:async';

Future<List<User>> getUsers() async {
  Response res = await get('https://jsonplaceholder.typicode.com/users');
  List<dynamic> response = jsonDecode(res.body);
//  print(response);
  return response.map((user) => User.fromJson(user)).toList();
}