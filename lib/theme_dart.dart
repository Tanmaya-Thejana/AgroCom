import 'dart:ui';
import 'package:flutter/cupertino.dart';

class Colours {
  const Colours();

  static const Color loginGradientStart = const Color(0xFFF9FD8CB);
  static const Color loginGradientEnd = const Color(0xFF008B79);
  static const Color homeButton = const Color(0xFF00A8A1);
  static const Color textColor = const Color(0xFF0F1D6B);
  static const Color background = const Color(0xFF5BC4B8);

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
