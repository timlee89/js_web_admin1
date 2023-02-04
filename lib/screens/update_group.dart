import 'package:flutter/material.dart';

class UpdateGroup extends StatelessWidget {
  static const String id = "update-group";

  const UpdateGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "코스, 시리즈에 대한 내용을 수정한다",
        style: TextStyle(fontSize: 30, color: Colors.blue),
      ),
    );
  }
}
