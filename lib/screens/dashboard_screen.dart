import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:js_web_admin1/services/firebase_services.dart';

class DashboardScreen extends StatelessWidget {
  static const String id = "dashboard-screen";
  final FirebaseServices _services =  FirebaseServices();

  DashboardScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Widget analyticWidget({required String title, required String value}) {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      value,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Icon(
                      Icons.show_chart,
                      color: Colors.white,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: _services.users.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )),
                  );
                }
                if (snapshot.hasData) {
                  return analyticWidget(
                      title: "Total Users",
                      value: snapshot.data!.size.toString());
                }
                return const SizedBox();
              },
            ),
            analyticWidget(title: "Total Category", value: "0"),
            analyticWidget(title: "Total Item", value: "0"),
          ],
        ),
      ],
    );
  }
}
