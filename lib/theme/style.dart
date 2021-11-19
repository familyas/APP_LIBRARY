import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

Color darkOrange = Color(0xED502E);
Color themeOranges = Color.fromRGBO(255, 88, 33, 0.6);

bgGradient() {
  return LinearGradient(
    colors: [
      Color(0xFEF1E7),
      darkOrange.withOpacity(0.2),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

ToastFuture MessageToash(BuildContext context, String Message) {
  return showToast(
    Message,
    context: context,
    backgroundColor: themeOranges,
    animation: StyledToastAnimation.slideFromTopFade,
    reverseAnimation: StyledToastAnimation.slideToTopFade,
    position: StyledToastPosition(
      align: Alignment.topCenter,
      offset: 0.0,
    ),
    startOffset: Offset(
      0.0,
      -3.0,
    ),
    reverseEndOffset: Offset(
      0.0,
      -3.0,
    ),
    duration: Duration(seconds: 4),
    //Animation duration   animDuration * 2 <= duration
    animDuration: Duration(seconds: 1),
    curve: Curves.fastLinearToSlowEaseIn,
    reverseCurve: Curves.fastOutSlowIn,
  );
}
