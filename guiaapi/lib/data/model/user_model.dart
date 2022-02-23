import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:guiaapi/data/model/type_model.dart';

class UserModel {
  String id;
  String name;
  String username;
  List<TypeModel> types;
  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.types,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? username,
    List<TypeModel>? types,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      types: types ?? this.types,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'types': types.map((x) => x.toMap()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      types:
          List<TypeModel>.from(map['types']?.map((x) => TypeModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, username: $username, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.username == username &&
        listEquals(other.types, types);
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ username.hashCode ^ types.hashCode;
  }
}
