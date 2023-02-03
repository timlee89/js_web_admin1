import 'package:flutter/material.dart';

class ManageItem extends StatelessWidget {
  static const String id = "manage-item";

  const ManageItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Manage Items Screen",
        style: TextStyle(fontSize: 30, color: Colors.blue),),
    );
  }
}
