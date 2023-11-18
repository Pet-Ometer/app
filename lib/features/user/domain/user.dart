import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@Freezed()
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String password,
}) = _User;

  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static Future<List<User>> checkInitialData() async {
    String content =
    await rootBundle.loadString("assets/initialData/users.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => User.fromJson(jsonData)).toList();
  }
}

/// The data associated with users.
class UserData {
  UserData({
    required this.id,
    required this.email,
    required this.password,
  });

  String id;
  String email;
  String password;
}