import 'package:flutter/material.dart';

class ManageCategory extends StatelessWidget {
  static const String id = "manage-category";

  const ManageCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Manage Category Screen",
        style: TextStyle(fontSize: 30, color: Colors.blue),),
    );
  }
}
