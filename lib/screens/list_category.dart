import 'package:flutter/material.dart';

class ListCategory extends StatelessWidget {
  static const String id = "list-category";

  const ListCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "등록되어 있는 category를 확인할 수 있는 페이지",
        style: TextStyle(fontSize: 30, color: Colors.blue),
      ),
    );
  }
}
