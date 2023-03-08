import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zema/constants/colors.dart';
import 'package:zema/constants/common.dart';
import 'package:zema/screens/home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => MaterialApp(
        title: 'Zema',
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
