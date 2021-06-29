import 'package:animated_covid/pages/covid_safe/covid_safe_page.dart';
import 'package:animated_covid/pages/pages.dart';
import 'package:animated_covid/utils/constanst.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.APP_NAME,
      home: CovidSafePage(),
    );
  }
}
