import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../data/models/profile_model.dart';

class ProfileHeaderDelegate extends SliverPersistentHeaderDelegate {
  final ProfileModel profile;

  ProfileHeaderDelegate({required this.profile});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    return Container(
      height: (maxExtent - shrinkOffset).clamp(minExtent, maxExtent),
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 100 - (50 * percent),
            height: 100 - (50 * percent),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: profile.profilePhoto.isNotEmpty
                  ? Image.network(
                profile.profilePhoto,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.person, size: 50),
              )
                  : const Icon(Icons.person, size: 50),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  style: TextStyle(
                    fontSize: 20 - (5 * percent),
                    fontWeight: FontWeight.bold,
                    color: AppColors.redPinkMain,
                  ),
                  child: Text(profile.username),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: 1 - percent,
                  child: Text(
                    "@${profile.username}",
                    style: TextStyle(color: AppColors.redPinkMain),
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: 1 - percent,
                  child: Text(
                    profile.presentation,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inverseSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 160.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
