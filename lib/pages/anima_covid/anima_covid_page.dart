import 'package:animated_covid/widgets/headline.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class AnimaCovidPage extends StatelessWidget {
  const AnimaCovidPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffc66b),
      // appBar: _buildAppBar(context),
      body: SafeArea(
        child: BodyAnimaCovid(),
      ),
    );
  }
}

// AppBar _buildAppBar(BuildContext context) {
//   return AppBar(
//     centerTitle: true,
//     title: Text(
//       (ModalRoute.of(context)!.settings.arguments as Map)['title'] ?? "",
//     ),
//   );
// }

class BodyAnimaCovid extends StatefulWidget {
  BodyAnimaCovid({Key? key}) : super(key: key);

  @override
  _BodyAnimaCovidState createState() => _BodyAnimaCovidState();
}

class _BodyAnimaCovidState extends State<BodyAnimaCovid>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //เมื่อเสร็จให้ทำการย้อนกลับ
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          //เมื่อกลับไปจุดเริ่มต้น ให้กลับไปทำใหม่
          controller.forward();
        }
      })
      ..addStatusListener((state) => print('$state'));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) => AnimatedLogo(animation: animation);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  // Make the Tweens static because they don't change.
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  static final _alignTween = Tween<double>(begin: 1.0, end: 1.2);

  AnimatedLogo({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return 
    Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: FlutterLogo(),
        ),
      ),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({required this.child, required this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) => Container(
            height: animation.value,
            width: animation.value,
            child: child,
          ),
          child: child,
        ),
      );
}

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: FlutterLogo(),
      );
}

class ShakeCurve extends Curve {
  @override
  double transform(double t) => sin(t * pi * 2);
}
