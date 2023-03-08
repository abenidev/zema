import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zema/constants/colors.dart';
import 'package:zema/screens/albums_screen.dart';
import 'package:zema/screens/explore_screen.dart';
import 'package:zema/screens/favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedHeaderIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void changeSelectedHeaderIndex(int newIndex) => setState(() => selectedHeaderIndex = newIndex);

  List<Widget> homeComponents = const [
    ExploreScreen(),
    AlbumsScreen(),
    FavoritesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              HeaderWidget(selectedHeaderIndex: selectedHeaderIndex, changeSelectedHeaderIndex: changeSelectedHeaderIndex),
              Expanded(child: homeComponents[selectedHeaderIndex]),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.selectedHeaderIndex, required this.changeSelectedHeaderIndex});
  final int selectedHeaderIndex;
  final Function(int) changeSelectedHeaderIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: const BoxDecoration(
        color: KColors.headerColor,
      ),
      height: 8.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeaderButton(
            isSelected: selectedHeaderIndex == 0,
            label: 'Explore',
            onTap: () => changeSelectedHeaderIndex(0),
          ),
          HeaderButton(
            isSelected: selectedHeaderIndex == 1,
            label: 'Albums',
            onTap: () => changeSelectedHeaderIndex(1),
          ),
          HeaderButton(
            isSelected: selectedHeaderIndex == 2,
            label: 'Favorites',
            onTap: () => changeSelectedHeaderIndex(2),
          ),
        ],
      ),
    );
  }
}

class HeaderButton extends StatelessWidget {
  const HeaderButton({super.key, required this.isSelected, required this.label, required this.onTap});
  final bool isSelected;
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 18.w,
        padding: EdgeInsets.symmetric(vertical: 0.3.h),
        decoration: BoxDecoration(color: isSelected ? KColors.colorLight : Colors.transparent, borderRadius: BorderRadius.circular(50.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(label, style: TextStyle(fontSize: 16.sp, color: isSelected ? KColors.colorDark : KColors.colorLight, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
