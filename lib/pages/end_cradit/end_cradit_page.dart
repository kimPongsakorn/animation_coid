import 'package:animated_background/animated_background.dart';
import 'package:animated_covid/pages/covid_safe/covid_safe_page.dart';
import 'package:animated_covid/pages/end_cradit/widget/textend.dart';
import 'package:animated_covid/utils/constanst.dart';
import 'package:animated_covid/widgets/custom_page_route.dart';
import 'package:flutter/material.dart';

class EndCraditPage extends StatelessWidget {
  const EndCraditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.BG_COLOR,
      body: SafeArea(
        child: BodyEndCradit(),
      ),
    );
  }
}

class BodyEndCradit extends StatefulWidget {
  BodyEndCradit({Key? key}) : super(key: key);

  @override
  _BodyEndCraditState createState() => _BodyEndCraditState();
}

class _BodyEndCraditState extends State<BodyEndCradit>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      behaviour: BubblesBehaviour(),
      vsync: this,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 200,
            child: TextEnd(),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(CustomPageRoute(CovidSafePage()));
              print('tap');
            },
            child: Column(
              children: [
                ClipOval(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        Constant.REPLAY_IMAGE,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Text(
                  'เล่นอีกครั้ง...',
                  style: TextStyle(
                    fontFamily: "Prompt_Medium",
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
