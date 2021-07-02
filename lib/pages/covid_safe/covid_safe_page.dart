import 'package:animated_covid/pages/covid_safe/widget/animation.dart';
import 'package:animated_covid/pages/covid_safe/widget/swiper_covid_tip.dart';
import 'package:animated_covid/pages/covid_safe/widget/title.dart';
import 'package:animated_covid/pages/end_cradit/end_cradit_page.dart';
import 'package:animated_covid/utils/constanst.dart';
import 'package:animated_covid/widgets/circle_painter.dart';
import 'package:animated_covid/widgets/custom_page_route.dart';
import 'package:flutter/material.dart';

class CovidSafePage extends StatefulWidget {
  const CovidSafePage({Key? key}) : super(key: key);

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

  late Animation<double> _titleAnimation;
  late AnimationController _titleController;

  bool selectedCovid = false;
  bool selectedShow = false;

  int _currentScene = 0;

  final List<Map<String, String>> _sceneData = [
    {
      'anim': Constant.WASH_YOUR_HANDS_LOTIE,
      'tip': 'หมั่นล้างมือบ่อยๆ',
    },
    {
      'anim': Constant.HAND_SANITIZER_LOTIE,
      'tip': ' พกแอลกอฮอล์เจล \nไว้ใช้ล้างมือเป็นประจำ',
    },
    {
      'anim': Constant.FACE_MASK_1_LOTIE,
      'tip': ' สวมหน้ากากอนามัยทุกครั้ง\nก่อนออกจากบ้าน',
    },
    {
      'anim': Constant.SOCIAL_DISTANCING_LOTIE,
      'tip': 'เว้นระยะห่างระหว่างกัน \nSocial Distance',
    },
    {
      'anim': Constant.SAFE_AT_HOME_LOTIE,
      'tip': 'Stay at Home',
    },
  ];

  @override
  void initState() {
    super.initState();
    setupTitle();
    setupCirclePainter();
    setupCovid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.BG_COLOR,
      body: SafeArea(
        child: Padding(
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
                          _circlePainterController,
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
                      sizeFactor: _titleAnimation,
                      axis: Axis.horizontal,
                      axisAlignment: -1,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: TitleTip(
                            animation: _covidAnimation,
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
                              child: SwiperCovidTip(_sceneData,_currentScene),
                            ),
                          )
                        : SizedBox(),
                    AnimatedCovid(
                      animation: _covidAnimation,
                      selectedCovid: selectedCovid,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _controller.dispose();
    _covidController.dispose();
    _circlePainterController.dispose();
    super.dispose();
  }

  void setupCovid() {
    _covidController = AnimationController(
      duration: const Duration(seconds: 3),
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
              _currentScene = ++_currentScene;
              setupSwiper();
            });
            if (_currentScene >= _sceneData.length) {
              Navigator.of(context).push(
                CustomPageRoute(
                  EndCraditPage(),
                ),
              );
            }
            break;
          case AnimationStatus.forward:
            break;
          case AnimationStatus.reverse:
            break;
        }
      });
    _covidController.forward();
  }

  void setupSwiper() {
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
  }

  void setupCirclePainter() {
    _circlePainterController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  void setupTitle() {
    _titleController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _titleController.forward();
    _titleAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_titleController);
  }
}
