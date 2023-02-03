import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:js_web_admin1/screens/dashboard_screen.dart';
import 'package:js_web_admin1/screens/login_screen.dart';
import 'package:js_web_admin1/screens/new_meditation.dart';
import 'package:js_web_admin1/screens/manage_items.dart';
import 'package:js_web_admin1/screens/test_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _selectedScreen = DashboardScreen();
  currentScreen(item) {
    switch (item.route) {
      case DashboardScreen.id:
        setState(() {
          _selectedScreen = DashboardScreen();
        });
        break;
      case NewMeditation.id:
        setState(() {
          _selectedScreen = NewMeditation();
        });
        break;
      case ManageItem.id:
        setState(() {
          _selectedScreen = ManageItem();
        });
        break;
      case TestScreen.id:
        setState(() {
          _selectedScreen = TestScreen();
        });
        break;
    }
  }

  final List<AdminMenuItem> _sideBarItems = const [
    AdminMenuItem(
      title: 'Dashboard ',
      route: DashboardScreen.id,
      icon: Icons.dashboard,
    ),
    AdminMenuItem(
      title: '명상 컨텐츠 업데이트',
      route: NewMeditation.id,
      icon: Icons.category_rounded,
    ),
    AdminMenuItem(
      title: 'Manage Item',
      route: ManageItem.id,
      icon: Icons.pages,
    ),
    AdminMenuItem(
      title: 'Test Page',
      route: TestScreen.id,
      icon: Icons.padding_rounded,
    ),
    AdminMenuItem(
      title: 'Test 2',
      route: TestScreen.id,
      icon: Icons.padding_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Joongshim Admin'),
      ),
      sideBar: SideBar(
        items: _sideBarItems,
        selectedRoute: HomeScreen.id,
        onSelected: (item) {
          currentScreen(item);
        },

        // header: Container(
        //   height: 50,
        //   width: double.infinity,
        //   color: const Color(0xff444444),
        //   child: const Center(
        //     child: Text(
        //       'header',
        //       style: TextStyle(
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Center(
              //   child: Text("Here...", style: TextStyle(fontSize: 20, color: Colors.white),)
              // ),
              TextButton(
                child: Text("Logout"),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      LoginScreen.id, (route) => false);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 15),
                  padding: EdgeInsets.all(15),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: _selectedScreen,
      ),
    );
  }
}

// TextButton(
// child: Text("Logout"),
// onPressed: () async {
// await FirebaseAuth.instance.signOut();
// Navigator.of(context).pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
// },
// style: TextButton.styleFrom(
// backgroundColor: Colors.purple,
// foregroundColor: Colors.white,
// textStyle: TextStyle(fontSize: 15),
// padding: EdgeInsets.all(15),
// ),
// ),
