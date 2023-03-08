import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zema/components/square_album_art_card.dart';

import '../constants/common.dart';

class NewAlbumsLoadingCard extends StatelessWidget {
  const NewAlbumsLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: contentPaddingVal.w),
      child: Container(
        decoration: const BoxDecoration(),
        margin: EdgeInsets.only(right: 3.w),
        width: 65.w,
        child: Column(
          children: [
            const SquareAlbumArtCard(),
            SizedBox(height: 2.h),
            Container(
              decoration: const BoxDecoration(),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('', style: darkTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 17.sp)),
                      SizedBox(height: 0.5.h),
                      Text('', style: darkTextStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 15.sp)),
                    ],
                  ),

                  //icon
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
