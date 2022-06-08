import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/app_settings.dart';
import 'package:flutter_app/resources/widgets/floating_navigation_bar_widget.dart';
import 'package:flutter_app/resources/widgets/states/auth_required_state.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_framework/theme/helper/ny_theme.dart';

class MainPage extends NyStatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends AuthRequiredState<MainPage> {
  int _selectedIndex = 0;

  AppSettings _appSettings = new AppSettings.init(true, 'en');

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    Icon(
      Icons.call,
      size: 150,
    ),
    Icon(
      Icons.camera,
      size: 150,
    ),
    Icon(
      Icons.call,
      size: 150,
    ),
    Icon(
      Icons.camera,
      size: 150,
    ),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _onTapSettings() async {
    await Navigator.pushNamed(context, "/settings", arguments: _appSettings);

    //  Force rebuild widget
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Idunn'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle),
              width: 32,
              height: 32,
              child: ClipOval(
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                      onTap: _onTapSettings,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      child: Icon(Icons.settings)),
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: FloatingNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
