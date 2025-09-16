import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  // Base size you can scale from
  static const double _baseFontSize = 14.0;

  // Factory getters using GoogleFonts to guarantee proper font loading.
  static TextStyle regular({Color color = Colors.white, double? fontSize}) =>
      GoogleFonts.roboto(
        fontSize: fontSize ?? _baseFontSize,
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle medium({Color color = Colors.white, double? fontSize}) =>
      GoogleFonts.roboto(
        fontSize: fontSize ?? _baseFontSize,
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle bold({Color color = Colors.white, double? fontSize}) =>
      GoogleFonts.roboto(
        fontSize: fontSize ?? _baseFontSize,
        fontWeight: FontWeight.w700,
        color: color,
      );
}



