import 'package:animated_background/animated_background.dart';
import 'package:animated_covid/pages/covid_safe/covid_safe_page.dart';
import 'package:animated_covid/pages/end_cradit/widget/textend.dart';
import 'package:animated_covid/utils/constanst.dart';
import 'package:animated_covid/widgets/custom_page_route.dart';
import 'package:flutter/material.dart';

class EndCraditPage extends StatefulWidget {
  EndCraditPage({Key? key}) : super(key: key);

  @override
  _EndCraditPageState createState() => _EndCraditPageState();
}

class _EndCraditPageState extends State<EndCraditPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.BG_COLOR,
      body: SafeArea(
        child: AnimatedBackground(
          behaviour: BubblesBehaviour(),
          vsync: this,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextEndCradit(),
              SizedBox(
                height: 20,
              ),
              _buildBtnReplay(context),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _buildBtnReplay(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CustomPageRoute(
            CovidSafePage(),
          ),
        );
      },
      child: Column(
        children: [
          ClipOval(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
              ),
              child: Image.asset(
                Constant.REPLAY_IMAGE,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
