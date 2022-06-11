import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/widgets/app_text_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class ResponsiveButton extends StatelessWidget {
  ResponsiveButton(
      {Key? key, this.width = 120, this.text = '', this.isResponsive = false})
      : super(key: key);

  bool isResponsive;
  double? width;
  String text;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ThemeColor.get(context).buttonBackground),
        child: Row(
          mainAxisAlignment: isResponsive
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive
                ? Container(
                    margin: EdgeInsets.only(left: 20),
                    child: AppText(
                      text: text,
                      color: Colors.white,
                    ),
                  )
                : Container(),
            Image.asset(getImageAsset('button-one.png'))
          ],
        ),
      ),
    );
  }
}
