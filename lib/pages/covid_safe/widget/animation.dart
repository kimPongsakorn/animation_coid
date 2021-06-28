import 'package:animated_covid/utils/constanst.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieImg extends StatelessWidget {
  const LottieImg({
    required this.fit,
    required this.name,
    required this.width,
  });

  final String name;
  final double width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      name,
      width: width,
      fit: fit,
    );
  }
}

class Covid19 extends StatelessWidget {
  const Covid19({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 50,
      child: LottieImg(
        name: Constant.COVID19_LOTIE,
        width: 100.0,
        fit: BoxFit.contain,
      ),
    );
  }
}

class AnimatedCovid extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween2 = Tween<double>(begin: 20, end: 100);
  static final _sizeTween1 = Tween<double>(begin: 5, end: 70);
  static final _sizeTween3 = Tween<double>(begin: 5, end: 80);
  static final _sizeTween4 = Tween<double>(begin: 5, end: 50);
  static final _duration1 = Duration(seconds: 3);
  final selectedCovid;

  AnimatedCovid({
    Key? key,
    required Animation<double> animation,
    this.selectedCovid,
  }) : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: _duration1,
            top: selectedCovid ? -30 : 400,
            right: selectedCovid ? -100 : 100,
            child: LottieImg(
              name: Constant.COVID19_LOTIE,
              width: _sizeTween2.evaluate(animation),
              fit: BoxFit.contain,
            ),
          ),
          AnimatedPositioned(
            duration: _duration1,
            top: selectedCovid ? -70 : 390,
            right: selectedCovid ? -100 : 0,
            child: LottieImg(
              name: Constant.COVID19_LOTIE,
              width: _sizeTween1.evaluate(animation),
              fit: BoxFit.contain,
            ),
          ),
          AnimatedPositioned(
            duration: _duration1,
            top: selectedCovid ? -100 : 380,
            right: selectedCovid ? -100 : 50,
            child: LottieImg(
              name: Constant.COVID19_LOTIE,
              width: _sizeTween3.evaluate(animation),
              fit: BoxFit.contain,
            ),
          ),
          AnimatedPositioned(
            duration: _duration1,
            top: selectedCovid ? -100 : 350,
            right: selectedCovid ? -100 : 100,
            child: LottieImg(
              name: Constant.COVID19_LOTIE,
              width: _sizeTween4.evaluate(animation),
              fit: BoxFit.contain,
            ),
          ),
          // left
          AnimatedPositioned(
            duration: _duration1,
            top: selectedCovid ? -30 : 350,
            left: selectedCovid ? -100 : 100,
            child: LottieImg(
              name: Constant.COVID19_LOTIE,
              width: _sizeTween1.evaluate(animation),
              fit: BoxFit.contain,
            ),
          ),
          AnimatedPositioned(
            duration: _duration1,
            top: selectedCovid ? -100 : 400,
            left: selectedCovid ? -100 : 10,
            child: LottieImg(
              name: Constant.COVID19_LOTIE,
              width: _sizeTween2.evaluate(animation),
              fit: BoxFit.contain,
            ),
          ),
          AnimatedPositioned(
            duration: _duration1,
            top: selectedCovid ? -100 : 340,
            left: selectedCovid ? -100 : 30,
            child: LottieImg(
              name: Constant.COVID19_LOTIE,
              width: _sizeTween4.evaluate(animation),
              fit: BoxFit.contain,
            ),
          ),
          AnimatedPositioned(
            duration: _duration1,
            top: selectedCovid ? -100 : 300,
            left: selectedCovid ? -100 : 80,
            child: LottieImg(
              name: Constant.COVID19_LOTIE,
              width: _sizeTween1.evaluate(animation),
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
