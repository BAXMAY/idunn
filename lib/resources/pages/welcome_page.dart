import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/widgets/app_large_text_widget.dart';
import 'package:flutter_app/resources/widgets/app_text_widget.dart';
import 'package:flutter_app/resources/widgets/responsive_button_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class WelcomePage extends NyStatefulWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends NyState<WelcomePage> {
  @override
  init() async {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List images = ["welcome-one.png", "welcome-two.png", "welcome-three.png"];
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(getImageAsset(images[index])))),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(
                          text: "Trips",
                          color: Colors.red,
                        ),
                        AppText(
                          text: "Mountain",
                          size: 30,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: 250,
                            child: AppText(
                              text:
                                  "Mountain hikes give you an incredible sense of freedom along with endurance test",
                              color: Color(0xFF878593),
                              size: 14,
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        ResponsiveButton(
                          width: 120,
                        )
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          margin: EdgeInsets.only(bottom: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots
                                  ? ThemeColor.get(context).buttonBackground
                                  : ThemeColor.get(context)
                                      .buttonBackground
                                      .withOpacity(0.3)),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
