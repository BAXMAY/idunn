import 'package:flutter_app/resources/pages/account_page.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:flutter_app/resources/pages/login_page.dart';
import 'package:flutter_app/resources/pages/main_page.dart';
import 'package:flutter_app/resources/pages/settings_page.dart';
import 'package:flutter_app/resources/pages/splash_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:page_transition/page_transition.dart';

/*
|--------------------------------------------------------------------------
| App Router
|
| * [Tip] Create pages faster 🚀
| Run the below in the terminal to create new a page.
| "flutter pub run nylo_framework:main make:page my_page"
| Learn more https://nylo.dev/docs/3.x/router
|--------------------------------------------------------------------------
*/

appRouter() => nyRoutes((router) {
      router.route("/", (context) => SplashPage());

      router.route("/settings", (context) => SettingsPage(),
          transition: PageTransitionType.leftToRightWithFade);

      router.route("/login", (context) => LoginPage(),
          transition: PageTransitionType.fade);

      router.route("/account", (context) => AccountPage(),
          transition: PageTransitionType.fade);

      router.route("/main", (context) => MainPage(),
          transition: PageTransitionType.scale);
    });
