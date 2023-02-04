import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:js_web_admin1/screens/company_gift_ticket.dart';
import 'package:js_web_admin1/screens/dashboard_screen.dart';
import 'package:js_web_admin1/screens/gift_list.dart';
import 'package:js_web_admin1/screens/list_category.dart';
import 'package:js_web_admin1/screens/list_group.dart';
import 'package:js_web_admin1/screens/list_meditation.dart';
import 'package:js_web_admin1/screens/login_screen.dart';
import 'package:js_web_admin1/screens/manage_popup.dart';
import 'package:js_web_admin1/screens/manage_user.dart';
import 'package:js_web_admin1/screens/manager_question.dart';
import 'package:js_web_admin1/screens/register_category.dart';
import 'package:js_web_admin1/screens/register_group.dart';
import 'package:js_web_admin1/screens/register_meditation.dart';
import 'package:js_web_admin1/screens/test3.dart';
import 'package:js_web_admin1/screens/subscription_list.dart';
import 'package:js_web_admin1/screens/test_formBuilder.dart';
import 'package:js_web_admin1/screens/update_category.dart';
import 'package:js_web_admin1/screens/update_group.dart';
import 'package:js_web_admin1/screens/update_meditation.dart';

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
      case RegisterMeditation.id:
        setState(() {
          _selectedScreen = RegisterMeditation();
        });
        break;
      case ListMeditation.id:
        setState(() {
          _selectedScreen = const ListMeditation();
        });
        break;
      case UpdateMeditation.id:
        setState(() {
          _selectedScreen = const UpdateMeditation();
        });
        break;
      case RegisterGroup.id:
        setState(() {
          _selectedScreen = const RegisterGroup();
        });
        break;
      case ListGroup.id:
        setState(() {
          _selectedScreen = const ListGroup();
        });
        break;
      case UpdateGroup.id:
        setState(() {
          _selectedScreen = const UpdateGroup();
        });
        break;
      case RegisterCategory.id:
        setState(() {
          _selectedScreen = const RegisterCategory();
        });
        break;
      case ListCategory.id:
        setState(() {
          _selectedScreen = const ListCategory();
        });
        break;
      case UpdateCategory.id:
        setState(() {
          _selectedScreen = const UpdateCategory();
        });
        break;
      case SubscriptionList.id:
        setState(() {
          _selectedScreen = const SubscriptionList();
        });
        break;
      case GiftList.id:
        setState(() {
          _selectedScreen = const GiftList();
        });
        break;
      case CompanyGiftTicket.id:
        setState(() {
          _selectedScreen = const CompanyGiftTicket();
        });
        break;
      case UserManagement.id:
        setState(() {
          _selectedScreen = const UserManagement();
        });
        break;
      case QuestionManagement.id:
        setState(() {
          _selectedScreen = const QuestionManagement();
        });
        break;
      case PopupManagement.id:
        setState(() {
          _selectedScreen = const PopupManagement();
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
      title: 'Manage Meditations',
      icon: Icons.circle_rounded,
      children: [
        AdminMenuItem(
            title: 'Register Meditations', route: RegisterMeditation.id),
        AdminMenuItem(title: 'List Meditations', route: ListMeditation.id),
        AdminMenuItem(title: 'Update Meditations', route: UpdateMeditation.id),
      ],
    ),
    AdminMenuItem(
      title: 'Manage Groups',
      icon: Icons.list_rounded,
      children: [
        AdminMenuItem(title: 'Register Groups', route: RegisterGroup.id),
        AdminMenuItem(title: 'List Groups', route: ListGroup.id),
        AdminMenuItem(title: 'Update Groups', route: UpdateGroup.id),
      ],
    ),
    AdminMenuItem(
      title: 'Manage Categories',
      icon: Icons.book_rounded,
      children: [
        AdminMenuItem(title: 'Register Categories', route: RegisterCategory.id),
        AdminMenuItem(title: 'List Categories', route: ListCategory.id),
        AdminMenuItem(title: 'Update Categories', route: UpdateCategory.id),
      ],
    ),
    AdminMenuItem(
      title: 'Subscriptions & Gift',
      icon: Icons.card_giftcard_rounded,
      children: [
        AdminMenuItem(title: 'Subscriptions List', route: SubscriptionList.id),
        AdminMenuItem(title: 'Gift List', route: GiftList.id),
        AdminMenuItem(title: 'Company Gifts', route: CompanyGiftTicket.id),
      ],
    ),
    AdminMenuItem(
      title: 'User Management',
      route: UserManagement.id,
      icon: Icons.account_box_rounded,
    ),
    AdminMenuItem(
      title: 'Q&A Management',
      route: QuestionManagement.id,
      icon: Icons.question_mark_rounded,
    ),
    AdminMenuItem(
      title: 'Pop-up Management',
      route: PopupManagement.id,
      icon: Icons.bolt_rounded,
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
        scrollDirection: Axis.vertical,
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
