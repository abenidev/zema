import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zema/constants/colors.dart';
import 'package:zema/constants/common.dart';
import 'package:zema/constants/globals.dart';
import 'package:zema/providers/album_provider.dart';
import 'package:zema/providers/artist_provider.dart';
import 'package:zema/providers/player_provider.dart';
import 'package:zema/providers/track_provider.dart';
import 'package:zema/screens/home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AlbumProvider()),
        ChangeNotifierProvider(create: (context) => TrackProvider()),
        ChangeNotifierProvider(create: (context) => ArtistProvider()),
        ChangeNotifierProvider(create: (context) => PlayerProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => MaterialApp(
        title: 'Zema',
        scaffoldMessengerKey: snackbarKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          scaffoldBackgroundColor: KColors.bgColor,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
