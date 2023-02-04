import 'package:flutter/material.dart';

class QuestionManagement extends StatelessWidget {
  static const String id = "manage-questions";

  const QuestionManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "문의사항에 대응하는 페이지",
        style: TextStyle(fontSize: 30, color: Colors.blue),
      ),
    );
  }
}
