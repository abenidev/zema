import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zema/components/circle_album_art_card.dart';
import 'package:zema/components/shimmers.dart';
import 'package:zema/constants/common.dart';
import 'package:zema/models/album.dart';
import 'package:zema/models/artist.dart';
import 'package:zema/models/track.dart';
import 'package:zema/providers/artist_provider.dart';
import 'package:zema/providers/track_provider.dart';
import 'package:zema/screens/player_screen.dart';
import 'package:zema/utils/string_utils.dart';

import '../components/square_album_art_card.dart';
import '../components/title_component.dart';
import '../providers/album_provider.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int textLenLimit = 10;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //get albums
      if (!Provider.of<AlbumProvider>(context, listen: false).isInitLoaded) {
        Provider.of<AlbumProvider>(context, listen: false).getAlbums();
      }

      //get tracks
      if (!Provider.of<TrackProvider>(context, listen: false).isInitLoaded) {
        Provider.of<TrackProvider>(context, listen: false).getTracks(context);
      }

      //get artists
      if (!Provider.of<ArtistProvider>(context, listen: false).isInitLoaded) {
        Provider.of<ArtistProvider>(context, listen: false).getArtists();
      }
    });
  }

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
              Consumer<AlbumProvider>(
                builder: (context, value, child) {
                  bool loading = value.isLoading;
                  List<Album> albums = value.albums;

                  if (loading) {
                    return SizedBox(
                      height: 27.h,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade400,
                        highlightColor: Colors.grey.shade200,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: const [
                              NewAlbumsLoadingCard(),
                            ],
                          ),
                        ),
                      ),
                    );
                  }

                  //
                  return SizedBox(
                    height: 27.h,
                    child: ListView.builder(
                      // physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: albums.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const PlayerScreen()));
                        },
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: index == 0 ? EdgeInsets.only(left: contentPaddingVal.w) : const EdgeInsets.all(0),
                            child: Container(
                              decoration: const BoxDecoration(),
                              margin: EdgeInsets.only(right: 3.w),
                              width: 65.w,
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
                                            Text(getLimitedString(albums[index].albumName, textLenLimit),
                                                style: darkTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 17.sp)),
                                            SizedBox(height: 0.5.h),
                                            Text(getLimitedString(albums[index].artistName, textLenLimit),
                                                style: darkTextStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 15.sp)),
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
                  );
                },
              ),
              SizedBox(height: 0.2.h),

              const TitleComponent(title: 'New Music'),
              SizedBox(height: 2.h),

              Consumer<TrackProvider>(
                builder: (context, value, child) {
                  bool loading = value.isLoading;
                  List<Track> tracks = value.tracks;

                  if (loading) {
                    return SizedBox(
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
                    );
                  }

                  //
                  return SizedBox(
                    height: 28.h,
                    child: ListView.builder(
                      // physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: tracks.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const PlayerScreen()));
                        },
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: index == 0 ? EdgeInsets.only(left: contentPaddingVal.w) : const EdgeInsets.all(0),
                            child: Container(
                              decoration: const BoxDecoration(),
                              margin: EdgeInsets.only(right: 3.w),
                              width: 27.w,
                              child: Column(
                                children: [
                                  SquareAlbumArtCard(artUrl: tracks[index].trackCoverImage),
                                  SizedBox(height: 2.h),
                                  Container(
                                    decoration: const BoxDecoration(),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(getLimitedString(tracks[index].trackName, textLenLimit),
                                                style: darkTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 17.sp)),
                                            SizedBox(height: 0.2.h),
                                            Text(getLimitedString(tracks[index].albumName, textLenLimit),
                                                style: darkTextStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 15.sp)),
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
                  );
                },
              ),

              SizedBox(height: 0.2.h),

              const TitleComponent(title: 'New Artists'),
              SizedBox(height: 2.h),

              Consumer<ArtistProvider>(
                builder: (context, value, child) {
                  bool loading = value.isLoading;
                  List<Artist> artists = value.artists;

                  if (loading) {
                    return SizedBox(
                      height: 27.h,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade400,
                        highlightColor: Colors.grey.shade200,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: const [
                              NewArtistLoadingCard(),
                            ],
                          ),
                        ),
                      ),
                    );
                  }

                  //

                  return SizedBox(
                    height: 28.h,
                    child: ListView.builder(
                      // physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const PlayerScreen()));
                        },
                        child: Container(
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
                                  CircleAlbumArtCard(artUrl: artists.isEmpty ? null : artists[index].artistProfileImage),
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
                                            Text(getLimitedString(artists.isEmpty ? '' : artists[index].artistName, textLenLimit),
                                                style: darkTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 17.sp)),
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
                  );
                },
              ),

              //
            ],
          )),
    );
  }
}
