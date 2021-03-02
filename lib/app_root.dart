import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:custom_navigator/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:huruapp/src/app/information/info_file.dart';
import 'package:huruapp/src/app/service/service_files.dart';

class AppRoot extends StatefulWidget {
  @override
  _AppRootState createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int _currentIndex = 0;
  bool isLoggedIn = false;

  final List<Widget> _children = [
    Info(),
    Service(),
  ];

  void _onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomNavigator(
        navigatorKey: navigatorKey,
        home: _children[_currentIndex],
        pageRoute: PageRoutes.materialPageRoute,
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedColor: Color(0xff040307),
        strokeColor: Color(0x30040307),
        unSelectedColor: Color(0xffacacac),
        backgroundColor: Colors.white,
        items: [
          CustomNavigationBarItem(
            icon: Icon(Icons.info_outline_rounded),
            title: Text('Information'),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.medical_services_outlined),
            title: Text('Service'),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onTappedBar,
      ),
    );
  }
}
