import 'package:flutter/material.dart';
import 'package:flutter_app/resources/widgets/app_text_widget.dart';

class AppButtons extends StatelessWidget {
  AppButtons(
      {Key? key,
      this.text,
      this.icon,
      this.isIcon = false,
      required this.size,
      required this.color,
      required this.backgroundColor,
      required this.borderColor})
      : super(key: key);

  final Color color;
  String? text;
  IconData? icon;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool? isIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            )
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
