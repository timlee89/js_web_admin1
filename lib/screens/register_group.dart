import 'package:flutter/material.dart';

class RegisterGroup extends StatelessWidget {
  static const String id = "register-group";

  const RegisterGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "새로운 코스, 시리즈 그룹의 내용을 등록하는 페이지",
        style: TextStyle(fontSize: 30, color: Colors.blue),
      ),
    );
  }
}
