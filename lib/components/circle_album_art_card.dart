import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/colors.dart';

class CircleAlbumArtCard extends StatelessWidget {
  const CircleAlbumArtCard({super.key, this.artUrl});
  final String? artUrl;

  @override
  Widget build(BuildContext context) {
    if (artUrl != null) {
      return CachedNetworkImage(
        imageUrl: artUrl!,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            shape: BoxShape.circle,
            color: Colors.grey,
            boxShadow: [BoxShadow(color: KColors.colorDark.withOpacity(0.3), offset: const Offset(2, 3), blurRadius: 5)],
          ),
          height: 18.h,
        ),
        placeholder: (context, url) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade400,
            boxShadow: [BoxShadow(color: KColors.colorDark.withOpacity(0.3), offset: const Offset(2, 3), blurRadius: 5)],
          ),
          height: 18.h,
        ),
        errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
            boxShadow: [BoxShadow(color: KColors.colorDark.withOpacity(0.3), offset: const Offset(2, 3), blurRadius: 5)],
          ),
          height: 18.h,
          child: const Center(child: Icon(Icons.error)),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
        boxShadow: [BoxShadow(color: KColors.colorDark.withOpacity(0.3), offset: const Offset(2, 3), blurRadius: 5)],
      ),
      height: 18.h,
    );
  }
}
