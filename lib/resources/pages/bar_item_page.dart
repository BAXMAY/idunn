import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class BarItemPage extends StatefulWidget {
  BarItemPage({Key? key}) : super(key: key);

  @override
  _BarItemPageState createState() => _BarItemPageState();
}

class _BarItemPageState extends NyState<BarItemPage> {
  @override
  init() async {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Bar Page")),
    );
  }
}
