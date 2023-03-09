import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zema/models/album.dart';
import 'package:zema/providers/album_provider.dart';

import '../components/shimmers.dart';
import '../components/square_album_art_card.dart';
import '../constants/common.dart';
import '../utils/string_utils.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AlbumProvider>(
      builder: (context, value, child) {
        bool loading = value.isLoading;
        List<Album> albums = value.albums;

        if (loading) {
          return Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: SizedBox(
              height: 27.h,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade400,
                highlightColor: Colors.grey.shade200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      NewTrackLoadingCard(),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        //
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: SizedBox(
            // height: 28.h,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.85,
                crossAxisSpacing: 20,
                mainAxisSpacing: 0,
              ),
              itemCount: albums.length,
              itemBuilder: (context, index) => Container(
                decoration: const BoxDecoration(),
                child: Container(
                  decoration: const BoxDecoration(),
                  margin: EdgeInsets.only(right: 3.w, top: 5.h),
                  width: 27.w,
                  child: Column(
                    children: [
                      SquareAlbumArtCard(artUrl: albums[index].albumCoverImage),
                      SizedBox(height: 2.h),
                      Container(
                        decoration: const BoxDecoration(),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(getLimitedString(albums[index].albumName, 12), style: darkTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 17.sp)),
                                SizedBox(height: 0.2.h),
                                Text(getLimitedString(albums[index].artistName, 12), style: darkTextStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 15.sp)),
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
        );
      },
    );
  }
}
