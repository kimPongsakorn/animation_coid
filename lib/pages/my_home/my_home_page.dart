import 'dart:async';
import 'package:animated_covid/utils/constanst.dart';
import 'package:animated_covid/widgets/liquid.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.BG_COLOR,
      body: SafeArea(
        child: BodyMyHome(),
      ),
    );
  }
}

class BodyMyHome extends StatefulWidget {
  @override
  _BodyMyHomeState createState() => _BodyMyHomeState();
}

class _BodyMyHomeState extends State<BodyMyHome>
    with SingleTickerProviderStateMixin, TickerProviderStateMixin {
  bool _isPlaying = false;
  bool selectedCovid = false;
  bool selectedHide = false;
  bool selected = true;
  double _fontSize = 60;
  Color _color = Colors.blueGrey;

  // late AnimationController _animationController;
  // late Animation<double> _pulseAnimation;

// เวลาในการ delay
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // _animationController =
    //     AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    // _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
    //   CurvedAnimation(
    //     parent: _animationController,
    //     curve: Interval(
    //       0.125,
    //       0.250,
    //       curve: Curves.ease,
    //     ),
    //   ),
    // );

    // _pulseAnimation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed)
    //     _animationController.reverse();
    //   else if (status == AnimationStatus.dismissed)
    //     _animationController.forward();
    //   print(status);
    // });

    // animateCovid();
  }

  // void animateCovid() {
  //   if (_isPlaying)
  //     _animationController.stop();
  //   else
  //     _animationController.forward();

  //   setState(() {
  //     _isPlaying = !_isPlaying;
  //   });
  // }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void _longTap() {
    setState(() {
      selectedCovid = true;
      print(selectedCovid);
    });

    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        selectedHide = true;

        _fontSize = selectedHide ? 30 : 10;
        _color = Constant.EGG_COLOR;
        // selectedHide = !selectedHide;
        print(selectedHide);
        print(_fontSize);
        print(_color);
      });
    });

    // Future.delayed(
    //   const Duration(milliseconds: 5000),
    //   () {
    //     Navigator.pushReplacementNamed(
    //       context,
    //       Constant.SAFE_COVID_ROUTE,
    //       arguments: {'title': 'AnimatedAlign'},
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'โควิด19',
              style: TextStyle(
                color: Constant.EGG_COLOR,
                fontSize: 20,
                fontFamily: "Prompt_Medium",
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Stack(
              // alignment: Alignment.center,
              children: <Widget>[
                selectedHide
                    ? Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(top: 50, bottom: 50),
                          child: AnimatedDefaultTextStyle(
                            child: Text(
                              'ไม่ประมาท การ์ดอย่าตก !',
                              textAlign: TextAlign.center,
                            ),
                            style: TextStyle(
                              fontFamily: "Prompt_Medium",
                              fontSize: _fontSize,
                              color: _color,
                              fontWeight: FontWeight.bold,
                            ),
                            duration: const Duration(seconds: 3),
                            curve: Curves.bounceInOut,
                          ),
                        ),
                      )
                    : Container(
                        child: null,
                      ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimationHuman(selectedHide: selectedHide),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 50, bottom: 50),
                    child: GestureDetector(
                      onTap: () {
                        _longTap();
                      },
                      child: AnimationCovid(
                          selectedHide: selectedHide,
                          selectedCovid: selectedCovid),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AnimationCovid extends StatelessWidget {
  const AnimationCovid({
    Key? key,
    required this.selectedHide,
    required this.selectedCovid,
  }) : super(key: key);

  final bool selectedHide;
  final bool selectedCovid;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: selectedHide ? 0 : 1,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 500),
      child: AnimatedAlign(
        alignment: selectedCovid ? Alignment.bottomCenter : Alignment.topCenter,
        duration: const Duration(seconds: 3),
        curve: Curves.easeInExpo,
        child: Lottie.asset(
          Constant.COVID19_LOTIE,
          width: MediaQuery.of(context).size.width * 0.75,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class AnimationHuman extends StatelessWidget {
  const AnimationHuman({
    Key? key,
    required this.selectedHide,
  }) : super(key: key);

  final bool selectedHide;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState:
          selectedHide ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(seconds: 2),
      firstChild: Image.asset(
        Constant.FACE_MASK_YES_IMAGE,
        width: MediaQuery.of(context).size.width * 0.75,
        fit: BoxFit.contain,
      ),
      secondChild: Image.asset(
        Constant.FACE_MASK_NO_IMAGE,
        width: MediaQuery.of(context).size.width * 0.75,
        fit: BoxFit.contain,
      ),
    );
  }
}
