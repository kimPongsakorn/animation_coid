import 'package:animated_covid/pages/pages.dart';
import 'package:animated_covid/pages/safe_covid/safe_covid_page.dart';
import 'package:animated_covid/utils/constanst.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final _route = <String, WidgetBuilder>{
    Constant.HOME_ROUTE: (context) => MyHomePage(),
    Constant.SAFE_COVID_ROUTE: (context) => SafeCovidPage(),
    Constant.ANIMA_COVID_ROUTE: (context) => AnimaCovidPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _route,
      title: Constant.APP_NAME,
      home: MyHomePage(),
    );
  }
}
