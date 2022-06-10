import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:nylo_framework/nylo_framework.dart';

class ResponsiveButton extends StatelessWidget {
  ResponsiveButton({Key? key, this.width, this.isResponsive = false})
      : super(key: key);

  final bool? isResponsive;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ThemeColor.get(context).buttonBackground),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset(getImageAsset('button-one.png'))],
      ),
    );
  }
}
