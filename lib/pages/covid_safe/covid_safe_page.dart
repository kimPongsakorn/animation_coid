import 'package:animated_covid/pages/covid_safe/widget/animation.dart';
import 'package:animated_covid/pages/covid_safe/widget/card_slider.dart';
import 'package:animated_covid/pages/covid_safe/widget/title.dart';
import 'package:animated_covid/utils/constanst.dart';
import 'package:animated_covid/widgets/circle_painter.dart';
import 'package:flutter/material.dart';

class CovidSafePage extends StatefulWidget {
  @override
  _CovidSafePageState createState() => _CovidSafePageState();
}

class _CovidSafePageState extends State<CovidSafePage>
    with SingleTickerProviderStateMixin, TickerProviderStateMixin {
  late Animation<double> _covidAnimation;
  late AnimationController _covidController;

  late Animation<double> _animation;
  late AnimationController _controller;

  late AnimationController _circlePainterController;

  bool selectedCovid = false;
  bool selectedShow = false;
  int _seconds = 2;

  @override
  void initState() {
    super.initState();
    setupCirclePainter();
    setupCovid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.BG_COLOR,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50),
              child: selectedShow
                  ? _buildCardSlider()
                  : TitleTip(
                      animation: _covidAnimation,
                    ),
            ),
            _buildAnimFaceMask(context),
            AnimatedCovid(
              animation: _covidAnimation,
              selectedCovid: selectedCovid,
            ),
          ],
        ),
      ),
    );
  }

  Align _buildCardSlider() {
    return Align(
      alignment: Alignment.topCenter,
      child: FadeTransition(
        opacity: _animation,
        child: CardSlider(),
      ),
    );
  }

  Align _buildAnimFaceMask(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomPaint(
        painter: CirclePainter(
          _circlePainterController,
          color: Colors.green.shade400,
        ),
        child: Image.asset(
          Constant.FACE_MASK_YES_IMAGE,
          width: MediaQuery.of(context).size.width * 0.70,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _covidController.dispose();
    _circlePainterController.dispose();
    super.dispose();
  }

  void setupCovid() {
    _covidController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    _covidAnimation = CurvedAnimation(
      parent: _covidController,
      curve: Curves.easeIn,
    )..addStatusListener((status) {
        switch (status) {
          case AnimationStatus.completed:
            _covidController.reverse();
            setState(() {
              selectedCovid = true;
            });
            break;
          case AnimationStatus.dismissed:
            _covidController.stop();

            setState(() {
              selectedShow = true;
              setupCardSlider();
            });

            break;
          case AnimationStatus.forward:
            break;
          case AnimationStatus.reverse:
            break;
        }
      });
    _covidController.forward();
  }

  void setupCardSlider() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _seconds),
    );
    _controller.forward();
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  void setupCirclePainter() {
    _circlePainterController = AnimationController(
      duration: Duration(seconds: _seconds),
      vsync: this,
    )..repeat();
  }
}
