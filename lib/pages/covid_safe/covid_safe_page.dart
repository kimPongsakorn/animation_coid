import 'package:animated_covid/pages/covid_safe/widget/animation.dart';
import 'package:animated_covid/pages/covid_safe/widget/swiper_covid_tip.dart';
import 'package:animated_covid/pages/covid_safe/widget/title.dart';
import 'package:animated_covid/pages/end_cradit/end_cradit_page.dart';
import 'package:animated_covid/utils/constanst.dart';
import 'package:animated_covid/widgets/circle_painter.dart';
import 'package:animated_covid/widgets/custom_page_route.dart';
import 'package:flutter/material.dart';

class CovidSafePage extends StatelessWidget {
  const CovidSafePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.BG_COLOR,
      body: SafeArea(
        child: BodyCovidSafe(),
      ),
    );
  }
}

class BodyCovidSafe extends StatefulWidget {
  BodyCovidSafe({Key? key}) : super(key: key);

  @override
  _BodyCovidSafeState createState() => _BodyCovidSafeState();
}

class _BodyCovidSafeState extends State<BodyCovidSafe>
    with SingleTickerProviderStateMixin, TickerProviderStateMixin {
  //covid
  late Animation<double> animation;
  late AnimationController controller;

  // size T
  late Animation<double> _animation;
  late AnimationController _controller;
  // CirclePainter
  late AnimationController _controllerpop;
  // title tip
  late Animation<double> _animationtip;
  late AnimationController _controllertip;

  bool selectedCovid = false;
  bool selectedShow = false;

  @override
  void initState() {
    super.initState();
    _controllertip = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _controllertip.forward();
    _animationtip = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controllertip);
    // CirclePainter
    _controllerpop = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //เมื่อเสร็จให้ทำการย้อนกลับ
          controller.reverse();

          setState(() {
            selectedCovid = true;
            print(selectedCovid);
          });
        } else if (status == AnimationStatus.dismissed) {
          //เมื่อกลับไปจุดเริ่มต้น ให้กลับไปทำใหม่
          controller.stop();

          setState(() {
            selectedShow = true;
          });
          _controller = AnimationController(
            vsync: this,
            duration: Duration(seconds: 2),
          );
          _controller.forward();
          // show SwiperCovidTip
          _animation = Tween(
            begin: 0.0,
            end: 1.0,
          ).animate(_controller);
          Future.delayed(const Duration(milliseconds: 27000), () {
            Navigator.of(context).push(CustomPageRoute(EndCraditPage()));
          });
        }
      })
      ..addStatusListener((state) => print('$state'));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomPaint(
                    painter: CirclePainter(
                      _controllerpop,
                      color: Colors.green.shade400,
                    ),
                    child: Image.asset(
                      Constant.FACE_MASK_YES_IMAGE,
                      width: MediaQuery.of(context).size.width * 0.70,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizeTransition(
                  sizeFactor: _animationtip,
                  axis: Axis.horizontal,
                  axisAlignment: -1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: TitleTip(
                        animation: animation,
                      ),
                    ),
                  ),
                ),
                selectedShow
                    ? Align(
                        alignment: Alignment.topCenter,
                        child: SizeTransition(
                          sizeFactor: _animation,
                          axis: Axis.horizontal,
                          axisAlignment: -1,
                          child: SwiperCovidTip(),
                        ),
                      )
                    : SizedBox(),
                AnimatedCovid(
                  animation: animation,
                  selectedCovid: selectedCovid,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controllertip.dispose();
    _controller.dispose();
    controller.dispose();
    _controllerpop.dispose();
    super.dispose();
  }
}
