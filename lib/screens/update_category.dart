import 'package:flutter/material.dart';

class UpdateCategory extends StatelessWidget {
  static const String id = "update-category";

  const UpdateCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "카테고리 구성을 수정하는 페이지",
        style: TextStyle(fontSize: 30, color: Colors.blue),
      ),
    );
  }
}
