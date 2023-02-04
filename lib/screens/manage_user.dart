import 'package:flutter/material.dart';

class UserManagement extends StatelessWidget {
  static const String id = "manage-users";

  const UserManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "회원 리스트를 관리하는 페이지 ",
        style: TextStyle(fontSize: 30, color: Colors.blue),
      ),
    );
  }
}
