import 'package:animated_covid/utils/constanst.dart';
import 'package:flutter/material.dart';

class TitleTip extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 0, end: 1);
  TitleTip({
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: RichText(
        text: TextSpan(
          text: 'วิธีป้องกันตัวเอง',
          style: TextStyle(
            color: Constant.EGG_COLOR,
            fontSize: 25,
            fontFamily: 'Prompt_Medium',
            fontWeight: FontWeight.bold,
          ),
          children: const <TextSpan>[
            TextSpan(
                text: '\nจากโรคติดต่อโควิด-19', style: TextStyle(fontSize: 22)),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
