import 'package:flutter/material.dart';
import 'package:labtonghop/listhomewrok.dart';
import 'package:labtonghop/model/user.dart';

void main() {
  User testUser = User(
    id: 1,
    username: "test_user",
    firstName: "Nguyễn",
    lastName: "Hoàng Long",
    email: "hoanglong@gmail.com",
    image:
        "https://wp-cms-media.s3.ap-east-1.amazonaws.com/lay_anh_dai_dien_facebook_dep_2_9566e566aa.jpg",
    accessToken: "token_mau",
  );
  runApp(MyApp(user: testUser));
}

class MyApp extends StatelessWidget {
  final User user;
  const MyApp({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomeWork(user: user));
  }
}
