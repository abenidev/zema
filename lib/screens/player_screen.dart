import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
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
  Duration? positionData;
  Duration? bufferedPositionData;
  Duration? durationData;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initAudioPlayerTracker();

      //   Provider.of<PlayerProvider>(context, listen: false).initAudioPlayer(Provider.of<TrackProvider>(context).tracks[0].trackAudioFile);
    });
  }

  initAudioPlayerTracker() {
    Provider.of<PlayerProvider>(context, listen: false).audioPlayer.positionStream.listen((value) {
      setState(() => positionData = value);
    });

    Provider.of<PlayerProvider>(context, listen: false).audioPlayer.bufferedPositionStream.listen((value) {
      setState(() => bufferedPositionData = value);
    });

    Provider.of<PlayerProvider>(context, listen: false).audioPlayer.durationStream.listen((value) {
      setState(() => durationData = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 6.h),
          decoration: const BoxDecoration(
            color: KColors.bgColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder(
                stream: Provider.of<PlayerProvider>(context).audioPlayer.sequenceStateStream,
                builder: (context, snapshot) {
                  final state = snapshot.data;
                  if (state?.sequence.isEmpty ?? true) {
                    return const SquareAlbumArtCard(isVisible: false);
                  }

                  final metaData = state!.currentSource!.tag as MediaItem;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10.h),
                      //

                      SizedBox(
                        width: 50.w,
                        child: SquareAlbumArtCard(
                          height: 30,
                          artUrl: metaData.artUri.toString(),
                        ),
                      ),

                      Text(metaData.title),
                      SizedBox(height: 2.h),
                      Text(metaData.artist ?? ''),
                    ],
                  );
                },
              ),

              //
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: ProgressBar(
                      barHeight: 8,
                      baseBarColor: Colors.grey.shade600,
                      bufferedBarColor: Colors.grey,
                      progressBarColor: Colors.red,
                      thumbColor: Colors.red,
                      timeLabelTextStyle: const TextStyle(color: KColors.colorDark, fontWeight: FontWeight.w600),
                      progress: positionData ?? Duration.zero,
                      buffered: bufferedPositionData ?? Duration.zero,
                      total: durationData ?? Duration.zero,
                      onSeek: Provider.of<PlayerProvider>(context).audioPlayer.seek,
                    ),
                  ),

                  //
                  SizedBox(height: 3.h),

                  //
                  const Controls(),
                ],
              ),
            ],
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: Provider.of<PlayerProvider>(context).audioPlayer.seekToPrevious,
          icon: const Icon(Icons.skip_previous_rounded),
          color: KColors.colorDark,
          iconSize: 80,
        ),

        //
        StreamBuilder(
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
                color: KColors.colorDark,
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                onPressed: Provider.of<PlayerProvider>(context).audioPlayer.pause,
                icon: const Icon(Icons.pause_rounded),
                color: KColors.colorDark,
                iconSize: 80,
              );
            }

            return const Icon(
              Icons.play_arrow_rounded,
              size: 80,
              color: KColors.colorDark,
            );

            //
          },
        ),

        IconButton(
          onPressed: Provider.of<PlayerProvider>(context).audioPlayer.seekToNext,
          icon: const Icon(Icons.skip_next_rounded),
          color: KColors.colorDark,
          iconSize: 80,
        ),
      ],
    );
  }
}
