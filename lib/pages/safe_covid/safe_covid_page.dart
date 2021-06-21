import 'package:animated_covid/utils/constanst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:lottie/lottie.dart';

class SafeCovidPage extends StatelessWidget {
  const SafeCovidPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.BG_COLOR,
      body: SafeArea(
        child: BodySafeCovid(),
      ),
    );
  }
}

class BodySafeCovid extends StatefulWidget {
  BodySafeCovid({Key? key}) : super(key: key);

  @override
  _BodySafeCovidState createState() => _BodySafeCovidState();
}

class _BodySafeCovidState extends State<BodySafeCovid>
    with TickerProviderStateMixin {
  late AnimationController animation;
  final List<Map<String, String>> data = [
    {
      'anim': 'assets/lottie/28783-face-mask-2.json',
      'tip': ' สวมหน้ากากอนามัยทุกครั้งก่อนออกจากบ้าน'
    },
    {'anim': 'assets/lottie/wash-your-hands.json', 'tip': 'หมั่นล้างมือบ่อยๆ'},
    {
      'anim': 'assets/lottie/17699-covid-19.json',
      'tip': ' พกแอลกอฮอล์เจล \nไว้ใช้ล้างมือเป็นประจำ'
    },
    {
      'anim': 'assets/lottie/30845-social-distancing.json',
      'tip': 'เว้นระยะห่างระหว่างกัน \nSocial Distance'
    },
    {
      'anim': 'assets/lottie/18168-stay-safe-stay-home.json',
      'tip': 'Stay at Home'
    },
  ];

  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: Constant.PURPLE_COLOR,
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
      color: Constant.EGG_COLOR,
      border: Border.all(
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.zero,
      // No shadow.
    ),
  );
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 5),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textTitle = Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        width: 250.0,
        child: Row(
          children: <Widget>[
            Lottie.asset(
              Constant.COVID19_LOTIE,
              width: MediaQuery.of(context).size.width * 0.20,
              fit: BoxFit.contain,
            ),
            Text.rich(
              TextSpan(
                text: 'ไม่ประมาท',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: "Prompt_Medium",
                  color: Constant.EGG_COLOR,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: '\nการ์ดอย่าตก',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: "Prompt_Medium",
                        decoration: TextDecoration.underline,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          textTitle,
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: Swiper(
              itemCount: data.length,
              pagination: new SwiperPagination(),
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
                          // color: Colors.white,
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
            ),
          ),
        ],
      ),
    );
  }
}
