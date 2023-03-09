import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/common.dart';

class TitleComponent extends StatelessWidget {
  const TitleComponent({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: contentPadding,
      child: Text(
        title,
        style: darkTextStyle.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w600),
      ),
    );
  }
}
