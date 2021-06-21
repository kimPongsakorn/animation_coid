import 'package:flutter/material.dart';

class Background extends StatelessWidget implements PreferredSizeWidget {
  final List<Color>? color1;

  const Background({Key? key, this.color1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          tileMode: TileMode.mirror,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: color1!,
          stops: [
            0,
            1,
          ],
        ),
        backgroundBlendMode: BlendMode.srcOver,
      ),
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
