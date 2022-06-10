import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/pages/bar_item_page.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:flutter_app/resources/pages/my_page.dart';
import 'package:flutter_app/resources/pages/search_page.dart';
import 'package:flutter_app/resources/pages/welcome_page.dart';
import 'package:flutter_app/resources/widgets/floating_navigation_bar_widget.dart';
import 'package:flutter_app/resources/widgets/states/auth_required_state.dart';
import 'package:nylo_framework/nylo_framework.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends AuthRequiredState<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _pages = <Widget>[
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _onTapSettings() async {
    await Navigator.pushNamed(context, "/settings");

    //  Force rebuild widget
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Idunn'),
      //   actions: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.only(right: 20.0),
      //       child: Container(
      //         decoration: BoxDecoration(shape: BoxShape.circle),
      //         width: 32,
      //         height: 32,
      //         child: ClipOval(
      //           child: Material(
      //             type: MaterialType.transparency,
      //             child: InkWell(
      //                 onTap: _onTapSettings,
      //                 borderRadius: BorderRadius.all(Radius.circular(16)),
      //                 child: Icon(Icons.settings)),
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      body: _pages.elementAt(_selectedIndex),
      // bottomNavigationBar: FloatingNavigationBar(
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      // ),

      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        // NOTE: When BottomNavigationBarType is shifting
        //  The bgColor came from BottomNavigationBarItem's bgColor
        items: [
          BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.apps),
              backgroundColor: ThemeColor.get(context).bottomTabBarBackground),
          BottomNavigationBarItem(
              label: "Bar",
              icon: Icon(Icons.bar_chart),
              backgroundColor: ThemeColor.get(context).bottomTabBarBackground),
          BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
              backgroundColor: ThemeColor.get(context).bottomTabBarBackground),
          BottomNavigationBarItem(
              label: "My",
              icon: Icon(Icons.person),
              backgroundColor: ThemeColor.get(context).bottomTabBarBackground),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
