import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'colors.dart';

const SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
  statusBarColor: KColors.bgColor,
);

TextStyle darkTextStyle = TextStyle(color: KColors.colorDark, fontSize: 16.sp);

EdgeInsets mainPadding = EdgeInsets.symmetric(vertical: 2.h);
const int contentPaddingVal = 4;
EdgeInsets contentPadding = EdgeInsets.symmetric(horizontal: contentPaddingVal.w);
