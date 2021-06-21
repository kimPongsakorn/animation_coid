import 'package:flutter/material.dart';

class Constant {
  //routes
  static const String HOME_ROUTE = '/home';
  static const String SAFE_COVID_ROUTE = '/covid/safe';
  static const String ANIMA_COVID_ROUTE = '/amnima/covid';

  //strings
  static const String APP_NAME = 'Animation COVID-19';

  // image
  static const String IMAGE_DIR = 'assets/images';
  static const String FACE_MASK_NO_IMAGE = '$IMAGE_DIR/face-mask-no.png';
  static const String FACE_MASK_YES_IMAGE = '$IMAGE_DIR/face-mask-yes.png';

  // lottie
  static const String LOTTIE_DIR = 'assets/lottie';
  static const String COVID19_LOTIE =
      '$LOTTIE_DIR/28663-coronavirus-covid-19.json';
  static const String HUMAN_LOTIE = '$LOTTIE_DIR/55384-cute-person.json';
  static const String FACE_MASK_LOTIE = '$LOTTIE_DIR/face-mask-1.json';

  //color
  static const Color PRIMARY_COLOR = Color(0xFF212121);
  static const Color PINK_COLOR = Color(0xFFF35383);
  static const Color PURPLE_COLOR = Color(0xFF8A6BA5);
  static const Color EGG_COLOR = Color(0xFFFEE8D7);
  static const Color BG_COLOR = Color(0xFF272A3F);
  static const Color BG_WHITE_COLOR = Color(0xFFFFFFFF);
  static const Color BG_LOAD_COLOR = Color(0xFFe1e5e7);

  //font
  static const String PROMPT_REGULAR = 'Prompt_Regular';
  static const String PROMPT_MEDIUM = 'Prompt_Medium';
}
