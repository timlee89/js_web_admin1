import 'package:flutter/material.dart';

class PopupManagement extends StatelessWidget {
  static const String id = "manage-popups";

  const PopupManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "앱을 열자마자 뜨는 팝업 메시지를 관리하는 페이지 ",
        style: TextStyle(fontSize: 30, color: Colors.blue),
      ),
    );
  }
}
