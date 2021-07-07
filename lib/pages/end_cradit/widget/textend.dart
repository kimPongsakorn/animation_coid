
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TextEndCradit extends StatelessWidget {
  const TextEndCradit({Key? key}) : super(key: key);
  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 30.0,
    fontFamily: "Prompt_Medium",
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: colorizeTextStyle,
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'ไม่ประมาท \nการ์ดอย่าตก',
              textAlign: TextAlign.center,
            ),
            TypewriterAnimatedText('หยุดเชื้อ โควิด-19'),
          ],
        ),
      ),
    );
  }
}
