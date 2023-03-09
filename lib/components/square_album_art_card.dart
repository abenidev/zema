import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/colors.dart';

class SquareAlbumArtCard extends StatelessWidget {
  const SquareAlbumArtCard({super.key, this.artUrl, this.height = 18, this.isVisible = true});
  final String? artUrl;
  final int height;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    if (artUrl != null) {
      return CachedNetworkImage(
        imageUrl: artUrl!,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            color: !isVisible ? Colors.transparent : Colors.grey,
            borderRadius: BorderRadius.circular(10),
            boxShadow: !isVisible ? [] : [BoxShadow(color: KColors.colorDark.withOpacity(0.3), offset: const Offset(2, 3), blurRadius: 5)],
          ),
          height: height.h,
        ),
        placeholder: (context, url) => Container(
          decoration: BoxDecoration(
            color: !isVisible ? Colors.transparent : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(10),
            boxShadow: !isVisible ? [] : [BoxShadow(color: KColors.colorDark.withOpacity(0.3), offset: const Offset(2, 3), blurRadius: 5)],
          ),
          height: height.h,
        ),
        errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
            color: !isVisible ? Colors.transparent : Colors.grey,
            borderRadius: BorderRadius.circular(10),
            boxShadow: !isVisible ? [] : [BoxShadow(color: KColors.colorDark.withOpacity(0.3), offset: const Offset(2, 3), blurRadius: 5)],
          ),
          height: height.h,
          child: const Center(child: Icon(Icons.error)),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: !isVisible ? Colors.transparent : Colors.grey,
        borderRadius: BorderRadius.circular(10),
        boxShadow: !isVisible ? [] : [BoxShadow(color: KColors.colorDark.withOpacity(0.3), offset: const Offset(2, 3), blurRadius: 5)],
      ),
      height: height.h,
    );
  }
}
