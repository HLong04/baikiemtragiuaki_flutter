import 'package:labtonghop/model/adress.dart';
import 'package:labtonghop/model/name.dart';

class UserMain {
  final Address? address;
  final int? id;
  final String? email;
  final String? username;
  final String? password;
  final Name? name;
  final String? phone;
  final int? v;

  UserMain({
    this.address,
    this.id,
    this.email,
    this.username,
    this.password,
    this.name,
    this.phone,
    this.v,
  });

  // Factory để parse từ JSON Object sang User Object
  factory UserMain.fromJson(Map<String, dynamic> json) {
    return UserMain(
      address: json['address'] != null ? Address.fromJson(json['address']) : null,
      id: json['id'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      name: json['name'] != null ? Name.fromJson(json['name']) : null,
      phone: json['phone'],
      v: json['__v'], // Mapping trường __v
    );
  }

  // Hàm helper để lấy tên đầy đủ cho tiện
  String get fullName => "${name?.firstname ?? ''} ${name?.lastname ?? ''}".trim();
}