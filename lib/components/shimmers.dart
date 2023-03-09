import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zema/components/square_album_art_card.dart';

import '../constants/common.dart';
import 'circle_album_art_card.dart';

class NewArtistLoadingCard extends StatelessWidget {
  const NewArtistLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: contentPaddingVal.w),
          child: Container(
            decoration: const BoxDecoration(),
            margin: EdgeInsets.only(right: 3.w),
            width: 30.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAlbumArtCard(),
                SizedBox(height: 2.h),
                const NewArtistShimmerCard(),
              ],
            ),
          ),
        ),

        //
        Container(
          decoration: const BoxDecoration(),
          margin: EdgeInsets.only(right: 3.w),
          width: 30.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAlbumArtCard(),
              SizedBox(height: 2.h),
              const NewArtistShimmerCard(),
            ],
          ),
        ),

        //
        Container(
          decoration: const BoxDecoration(),
          margin: EdgeInsets.only(right: 3.w),
          width: 30.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAlbumArtCard(),
              SizedBox(height: 2.h),
              const NewArtistShimmerCard(),
            ],
          ),
        ),

        //
        Container(
          decoration: const BoxDecoration(),
          margin: EdgeInsets.only(right: 3.w),
          width: 30.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAlbumArtCard(),
              SizedBox(height: 2.h),
              const NewArtistShimmerCard(),
            ],
          ),
        ),

        //
        Container(
          decoration: const BoxDecoration(),
          margin: EdgeInsets.only(right: 3.w),
          width: 30.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAlbumArtCard(),
              SizedBox(height: 2.h),
              const NewArtistShimmerCard(),
            ],
          ),
        ),
      ],
    );
  }
}

class NewArtistShimmerCard extends StatelessWidget {
  const NewArtistShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('', style: darkTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 17.sp)),
            ],
          ),

          //icon
          Container(),
        ],
      ),
    );
  }
}

class NewTrackLoadingCard extends StatelessWidget {
  const NewTrackLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: contentPaddingVal.w),
          child: Container(
            decoration: const BoxDecoration(),
            margin: EdgeInsets.only(right: 3.w),
            width: 27.w,
            child: Column(
              children: [
                const SquareAlbumArtCard(),
                SizedBox(height: 2.h),
                const NewTrackShimmerComp(),
              ],
            ),
          ),
        ),

        //
        Container(
          decoration: const BoxDecoration(),
          margin: EdgeInsets.only(right: 3.w),
          width: 27.w,
          child: Column(
            children: [
              const SquareAlbumArtCard(),
              SizedBox(height: 2.h),
              const NewTrackShimmerComp(),
            ],
          ),
        ),
        //
        Container(
          decoration: const BoxDecoration(),
          margin: EdgeInsets.only(right: 3.w),
          width: 27.w,
          child: Column(
            children: [
              const SquareAlbumArtCard(),
              SizedBox(height: 2.h),
              const NewTrackShimmerComp(),
            ],
          ),
        ),
        //
        Container(
          decoration: const BoxDecoration(),
          margin: EdgeInsets.only(right: 3.w),
          width: 27.w,
          child: Column(
            children: [
              const SquareAlbumArtCard(),
              SizedBox(height: 2.h),
              const NewTrackShimmerComp(),
            ],
          ),
        ),
        //
        Container(
          decoration: const BoxDecoration(),
          margin: EdgeInsets.only(right: 3.w),
          width: 27.w,
          child: Column(
            children: [
              const SquareAlbumArtCard(),
              SizedBox(height: 2.h),
              const NewTrackShimmerComp(),
            ],
          ),
        ),
      ],
    );
  }
}

class NewAlbumsLoadingCard extends StatelessWidget {
  const NewAlbumsLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: contentPaddingVal.w),
          child: Container(
            decoration: const BoxDecoration(),
            margin: EdgeInsets.only(right: 3.w),
            width: 65.w,
            child: Column(
              children: [
                const SquareAlbumArtCard(),
                SizedBox(height: 2.h),
                const NewAlbumsShimmerComp(),
              ],
            ),
          ),
        ),

        //
        Container(
          decoration: const BoxDecoration(),
          margin: EdgeInsets.only(right: 3.w),
          width: 65.w,
          child: Column(
            children: [
              const SquareAlbumArtCard(),
              SizedBox(height: 2.h),
              const NewAlbumsShimmerComp(),
            ],
          ),
        ),
      ],
    );
  }
}

class NewTrackShimmerComp extends StatelessWidget {
  const NewTrackShimmerComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 1.75.h, width: 15.w, decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(5))),
              SizedBox(height: 0.5.h),
              Container(height: 1.75.h, width: 20.w, decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(5))),
            ],
          ),
          //icon
          Container(),
        ],
      ),
    );
  }
}

class NewAlbumsShimmerComp extends StatelessWidget {
  const NewAlbumsShimmerComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 1.75.h, width: 15.w, decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(5))),
              SizedBox(height: 0.5.h),
              Container(height: 1.75.h, width: 20.w, decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(5))),
            ],
          ),

          //icon
          Container(),
        ],
      ),
    );
  }
}
