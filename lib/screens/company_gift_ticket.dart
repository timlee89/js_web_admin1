import 'package:flutter/material.dart';

class CompanyGiftTicket extends StatelessWidget {
  static const String id = "company-gift-ticket";

  const CompanyGiftTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "회사차원에서 별도로 발행한 선물권 리스트와 그 사용현황을 체크하는 페이지 ",
        style: TextStyle(fontSize: 30, color: Colors.blue),
      ),
    );
  }
}
