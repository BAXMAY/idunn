import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class SettingsPage extends NyStatefulWidget {
  SettingsPage({Key? key}) : super(key: key);
  
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends NyState<SettingsPage> {

  @override
  init() async {
    
  }
  
  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SafeArea(
         child: Container(
           child: Text('Settings'),
         ),
      ),
    );
  }
}
