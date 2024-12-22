import 'package:flutter/cupertino.dart';


import '../view/login/location.dart';
import '../view/login/login_page.dart';
import '../view/splash/skip_splash.dart';
import '../view/splash/splash.dart';

Route onGenerateRoute(RouteSettings settings) {
  Route _createPageRoute(Widget Function(BuildContext) builder) {
    return CupertinoPageRoute(
      builder: builder,
    );
  }
  switch (settings.name) {
    case "/splash":
      return _createPageRoute((context) => SplashScreen());

    case "/skipSplash":
      return _createPageRoute((context) => SkipSplash());
    case "/loginPage":
      return _createPageRoute((context) => LoginPage ());
    case "/signInPage":
      return _createPageRoute((context) => Location ());


    default:
      return _createPageRoute((context) => Container());
  }
}