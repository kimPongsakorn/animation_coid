import 'package:animated_covid/utils/constanst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:lottie/lottie.dart';

class SwiperCovidTip extends StatefulWidget {
  SwiperCovidTip({Key? key}) : super(key: key);

  @override
  _SwiperCovidTipState createState() => _SwiperCovidTipState();
}

class _SwiperCovidTipState extends State<SwiperCovidTip>
    with TickerProviderStateMixin {
  final List<Map<String, String>> data = [
    {'anim': Constant.WASH_YOUR_HANDS_LOTIE, 'tip': 'หมั่นล้างมือบ่อยๆ'},
    {
      'anim': Constant.HAND_SANITIZER_LOTIE,
      'tip': ' พกแอลกอฮอล์เจล \nไว้ใช้ล้างมือเป็นประจำ'
    },
    {
      'anim': Constant.FACE_MASK_1_LOTIE,
      'tip': ' สวมหน้ากากอนามัยทุกครั้ง\nก่อนออกจากบ้าน'
    },
    {
      'anim': Constant.SOCIAL_DISTANCING_LOTIE,
      'tip': 'เว้นระยะห่างระหว่างกัน \nSocial Distance'
    },
    {'anim': Constant.SAFE_AT_HOME_LOTIE, 'tip': 'Stay at Home'},
  ];
  final DecorationTween decorationTween = DecorationTween(
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
    return Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              DecoratedBoxTransition(
                position: DecorationPosition.background,
                decoration: decorationTween.animate(_controller),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Lottie.asset(
                      data[index]['anim']!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  data[index]['tip']!,
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
        },
        physics: new NeverScrollableScrollPhysics(),
        viewportFraction: 1.0,
        scale: 1.0,
        layout: SwiperLayout.DEFAULT,
        itemHeight: 300.0,
        itemWidth: 300.0,
        loop: false,
        autoplayDelay: 6000,
        autoplay: true,
        itemCount: data.length);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}