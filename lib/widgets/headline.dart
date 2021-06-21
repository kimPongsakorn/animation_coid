// import 'package:flutter/material.dart';

// class Headline extends ImplicitlyAnimatedWidget {
//   final String text;
//   final int index;

// Color get targetColor =>  index == 0 ? Colors.black : Colors.blue;
//   const Headline({required this.text, required this.index, Key? key})
//       : super(key: key, duration: const Duration(milliseconds: 300));

//   @override
//   _HeadlineState createState() => _HeadlineState();
// }

// class _HeadlineState extends AnimatedWidgetBaseState<Headline> {
//   ColorTween _colorTween =
//       ColorTween(begin: Colors.black, end: Colors.blue);
//   @override
//   Widget build(BuildContext context) {
//     return Text('${widget.text} (${widget.index})');
//   }

//   @override
//   void forEachTween(visitor) {
//     visitor(
//       _colorTween,
//      widget.targetColor,
//      // Teen<T> Function(T targetValue)
//      (color) {
//     _colorTween = ColorTween(begin: color,end: widget.targetColor);
//     return _colorTween;
//      }
//     );
//   }
// }
