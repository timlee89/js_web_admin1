import 'package:flutter/material.dart';

class SubscriptionList extends StatelessWidget {
  static const String id = "subscription-list";

  const SubscriptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "판매된 구독권 현황을 체크하는 페이지 ",
        style: TextStyle(fontSize: 30, color: Colors.blue),
      ),
    );
  }
}
