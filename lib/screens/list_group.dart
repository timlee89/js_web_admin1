import 'package:flutter/material.dart';

class ListGroup extends StatelessWidget {
  static const String id = "list-group";

  const ListGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "어떤 코스, 시리즈가 있는지 리스트를 보여주는 페이지 \n 여기에서 선택하면 그 리스트에 대한 수정을 하는 페이지로 이동한다",
        style: TextStyle(fontSize: 30, color: Colors.blue),
      ),
    );
  }
}
