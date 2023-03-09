import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zema/components/square_album_art_card.dart';
import 'package:zema/constants/colors.dart';
import 'package:zema/providers/track_provider.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [KColors.headerColor, Color.fromARGB(255, 133, 39, 60)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                SizedBox(
                  width: 50.w,
                  child: SquareAlbumArtCard(
                    height: 30,
                    artUrl: Provider.of<TrackProvider>(context).tracks[0].trackCoverImage,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
