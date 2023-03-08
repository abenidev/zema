import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zema/constants/colors.dart';
import 'package:zema/constants/common.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: mainPadding,
          decoration: const BoxDecoration(),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleComponent(title: 'New Albums'),
              SizedBox(height: 2.h),

              //
              SizedBox(
                height: 27.h,
                child: ListView.builder(
                  // physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) => Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding: index == 0 ? EdgeInsets.only(left: contentPaddingVal.w) : const EdgeInsets.all(0),
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
                                      Text('Album Name', style: darkTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 17.sp)),
                                      SizedBox(height: 0.5.h),
                                      Text('Artist Name', style: darkTextStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 15.sp)),
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
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0.2.h),

              const TitleComponent(title: 'New Music'),
              SizedBox(height: 2.h),

              SizedBox(
                height: 28.h,
                child: ListView.builder(
                  // physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) => Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding: index == 0 ? EdgeInsets.only(left: contentPaddingVal.w) : const EdgeInsets.all(0),
                      child: Container(
                        decoration: const BoxDecoration(),
                        margin: EdgeInsets.only(right: 3.w),
                        width: 27.w,
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
                                      Text('Track Name', style: darkTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 17.sp)),
                                      SizedBox(height: 0.2.h),
                                      Text('Artist Name', style: darkTextStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 15.sp)),
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
                    ),
                  ),
                ),
              ),

              SizedBox(height: 0.2.h),

              const TitleComponent(title: 'New Artists'),
              SizedBox(height: 2.h),

              SizedBox(
                height: 28.h,
                child: ListView.builder(
                  // physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) => Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding: index == 0 ? EdgeInsets.only(left: contentPaddingVal.w) : const EdgeInsets.all(0),
                      child: Container(
                        decoration: const BoxDecoration(),
                        margin: EdgeInsets.only(right: 3.w),
                        width: 30.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                                boxShadow: [BoxShadow(color: KColors.colorDark.withOpacity(0.3), offset: const Offset(2, 3), blurRadius: 5)],
                              ),
                              height: 18.h,
                            ),

                            //
                            SizedBox(height: 2.h),
                            Container(
                              decoration: const BoxDecoration(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Artist Name', style: darkTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 17.sp)),
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
                    ),
                  ),
                ),
              ),

              //
            ],
          )),
    );
  }
}

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

class SquareAlbumArtCard extends StatelessWidget {
  const SquareAlbumArtCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: KColors.colorDark.withOpacity(0.3), offset: const Offset(2, 3), blurRadius: 5)],
      ),
      height: 18.h,
    );
  }
}
