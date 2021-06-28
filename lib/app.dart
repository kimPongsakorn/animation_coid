import 'package:animated_covid/pages/covid_safe/covid_safe_page.dart';
import 'package:animated_covid/pages/pages.dart';
import 'package:animated_covid/utils/constanst.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final _route = <String, WidgetBuilder>{
    Constant.COVID_SAFE_ROUTE: (context) => CovidSafePage(),
    Constant.END_CRADIT_ROUTE: (context) => EndCraditPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _route,
      title: Constant.APP_NAME,
      home: CovidSafePage(),
    );
  }
}
