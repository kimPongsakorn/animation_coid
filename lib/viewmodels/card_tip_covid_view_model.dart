import 'package:animated_covid/models/tip_covid.dart';
import 'package:animated_covid/utils/constanst.dart';

class TipCovidViewModel {

  const TipCovidViewModel();

  List<TipCovid> getTipCovidItems() => <TipCovid>[
        TipCovid(
          anim: Constant.WASH_YOUR_HANDS_LOTIE,
          tip: 'หมั่นล้างมือบ่อยๆ',
        ),
        TipCovid(
          anim: Constant.HAND_SANITIZER_LOTIE,
          tip: 'พกแอลกอฮอล์เจล \nไว้ใช้ล้างมือเป็นประจำ',
        ),
        TipCovid(
          anim: Constant.FACE_MASK_1_LOTIE,
          tip: 'สวมหน้ากากอนามัยทุกครั้ง\nก่อนออกจากบ้าน',
        ),
        TipCovid(
          anim: Constant.SOCIAL_DISTANCING_LOTIE,
          tip: 'เว้นระยะห่างระหว่างกัน \nsocial distancing',
        ),
        TipCovid(
          anim: Constant.SAFE_AT_HOME_LOTIE,
          tip: 'อยู่บ้านหยุดเชื้อ \nstay at Home',
        ),
      ];
}
