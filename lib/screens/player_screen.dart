import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zema/components/square_album_art_card.dart';
import 'package:zema/constants/colors.dart';
import 'package:zema/providers/player_provider.dart';
import 'package:zema/providers/track_provider.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Provider.of<PlayerProvider>(context, listen: false).initAudioPlayer(Provider.of<TrackProvider>(context).tracks[0].trackAudioFile);
    // });
  }

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
                //
                SizedBox(
                  width: 50.w,
                  child: SquareAlbumArtCard(
                    height: 30,
                    artUrl: Provider.of<TrackProvider>(context).tracks[0].trackCoverImage,
                  ),
                ),
                SizedBox(height: 5.h),
                //
                const Controls(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Controls extends StatelessWidget {
  const Controls({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<PlayerProvider>(context).audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;

        if (!(playing ?? false)) {
          return IconButton(
            onPressed: Provider.of<PlayerProvider>(context).audioPlayer.play,
            icon: const Icon(Icons.play_arrow_rounded),
            iconSize: 80,
            color: KColors.colorLight,
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            onPressed: Provider.of<PlayerProvider>(context).audioPlayer.pause,
            icon: const Icon(Icons.pause_rounded),
            color: KColors.colorLight,
            iconSize: 80,
          );
        }

        return const Icon(
          Icons.play_arrow_rounded,
          size: 80,
          color: KColors.colorLight,
        );

        //
      },
    );
  }
}
