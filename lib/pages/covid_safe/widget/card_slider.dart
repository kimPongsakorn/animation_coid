import 'package:animated_covid/models/tip_covid.dart';
import 'package:animated_covid/pages/end_cradit/end_cradit_page.dart';
import 'package:animated_covid/viewmodels/card_tip_covid_view_model.dart';
import 'package:animated_covid/widgets/custom_page_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CardSlider extends StatelessWidget {
  final carouselController = CarouselController();
  final List<TipCovid> tips = TipCovidViewModel().getTipCovidItems();
  final _animateSecond = 6;

  @override
  Widget build(BuildContext context) {
    final screenData = tips.length - 1;
    return CarouselSlider.builder(
      itemCount: tips.length,
      carouselController: carouselController,
      itemBuilder: (BuildContext context, int index, int pageViewIndex) {
        final _model = tips[index];
        return CardTipCovid(
          anim: _model.anim,
          tip: _model.tip,
        );
      },
      options: CarouselOptions(
        height: 400,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: _animateSecond),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollPhysics: NeverScrollableScrollPhysics(),
        onPageChanged: (index, reason) {
          if (index == screenData) {
            carouselController.stopAutoPlay();
            Future.delayed(Duration(seconds: _animateSecond)).then((value) {
              Navigator.of(context).push(
                CustomPageRoute(
                  EndCraditPage(),
                ),
              );
            });
          }
        },
      ),
    );
  }
}

class CardTipCovid extends StatefulWidget {
  final anim;
  final tip;

  const CardTipCovid({Key? key, this.anim, this.tip}) : super(key: key);

  @override
  _CardTipCovidState createState() => _CardTipCovidState();
}

class _CardTipCovidState extends State<CardTipCovid>
    with TickerProviderStateMixin {
  DecorationTween get decorationTween => DecorationTween(
        begin: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          border: Border.all(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(60.0),
          shape: BoxShape.rectangle,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color(0x66666666),
              blurRadius: 10.0,
              spreadRadius: 3.0,
              offset: Offset(0, 6.0),
            )
          ],
        ),
        end: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          border: Border.all(
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.zero,
          // No shadow.
        ),
      );

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBoxTransition(
          position: DecorationPosition.background,
          decoration: decorationTween.animate(_controller),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.50,
            height: MediaQuery.of(context).size.height * 0.25,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Lottie.asset(
              widget.anim,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            widget.tip,
            style: TextStyle(
              fontFamily: "Prompt_Medium",
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
