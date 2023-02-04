import 'package:flutter/material.dart';

class RegisterCategory extends StatelessWidget {
  static const String id = "register-category";

  const RegisterCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "새로운 카테고리를 등록하는 페이지",
        style: TextStyle(fontSize: 30, color: Colors.blue),
      ),
    );
  }
}
