import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_colors.dart';

class FavouriteWidget extends StatefulWidget {
  const FavouriteWidget({super.key});

  @override
  State<FavouriteWidget> createState() => _TwoContainersFavoriteIconState();
}

class _TwoContainersFavoriteIconState extends State<FavouriteWidget> {
  bool isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isFavorited = !isFavorited;
        });
      },
      child: isFavorited
          ? Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: AppColors.redPinkMain,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(6),
        child: SvgPicture.asset(
          'assets/favourite.svg',
          color: AppColors.white,
        ),
      )
          : Container(
        width: 28,
        decoration: BoxDecoration(
          color: AppColors.pink,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(6),
        child: SvgPicture.asset(
          'assets/favourite.svg',
          color: AppColors.pinkSub,
        ),
      ),
    );
  }
}