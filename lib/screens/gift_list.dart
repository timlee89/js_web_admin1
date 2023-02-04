import 'package:flutter/material.dart';

class GiftList extends StatelessWidget {
  static const String id = "gift-list";

  const GiftList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "그동안 발행된 선물권 현황을 체크하는 페이지 ",
        style: TextStyle(fontSize: 30, color: Colors.blue),
      ),
    );
  }
}
