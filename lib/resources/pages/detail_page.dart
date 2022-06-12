import 'package:flutter/material.dart';
import 'package:flutter_app/cubit/app_cubit_states.dart';
import 'package:flutter_app/cubit/app_cubits.dart';
import 'package:flutter_app/resources/widgets/app_buttons_widget.dart';
import 'package:flutter_app/resources/widgets/app_large_text_widget.dart';
import 'package:flutter_app/resources/widgets/app_text_widget.dart';
import 'package:flutter_app/resources/widgets/responsive_button_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nylo_framework/nylo_framework.dart';

class DetailPage extends NyStatefulWidget {
  DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends NyState<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  init() async {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "http://mark.bslmeiyu.com/uploads/" +
                                    detail.place.img),
                            fit: BoxFit.cover),
                      ))),
              Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                      )
                    ],
                  )),
              Positioned(
                  top: 320,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: detail.place.name,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            AppLargeText(
                              text: '\$' + detail.place.price.toString(),
                              color: Color(0xFF5d69b3),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Color(0xFF5d69b3),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            AppText(
                              text: detail.place.location,
                              color: Color(0xFF989acd),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                  5,
                                  (index) => Icon(
                                        Icons.star,
                                        color: detail.place.stars > index
                                            ? Color(0xFFe7bb4e)
                                            : Color(0xFF878593),
                                      )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: '(5.0)',
                              color: Color(0xFF878593),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        AppLargeText(
                          text: 'People',
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: 'Number of people in your group',
                          color: Color(0xFFababad),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: AppButtons(
                                  size: 50,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black
                                      : Color(0xFFf1f1f9),
                                  borderColor: selectedIndex == index
                                      ? Colors.black
                                      : Color(0xFFf1f1f9),
                                  text: (index + 1).toString(),
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                          text: 'Description',
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AppText(
                          text: detail.place.description,
                          color: Color(0xFFababad),
                        ),
                      ],
                    ),
                  )),
              Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButtons(
                          size: 60,
                          color: Color(0xFF989acd),
                          backgroundColor: Colors.white,
                          borderColor: Color(0xFF989acd),
                          isIcon: true,
                          icon: Icons.favorite_border),
                      SizedBox(
                        width: 20,
                      ),
                      ResponsiveButton(
                        text: 'Book Trip Now',
                        isResponsive: true,
                      )
                    ],
                  ))
            ],
          ),
        ),
      );
    });
  }
}
