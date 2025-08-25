import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  final int maxRating;

  const RatingStars({
    super.key,
    required this.rating,
    this.maxRating = 5,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(maxRating.toInt(), (index) {
        if (index < rating.toInt()) {
          return SvgPicture.asset(
            'assets/icons/star-filled.svg',
          );
        } else {
          return SvgPicture.asset(
            'assets/icons/star-empty.svg',
          );
        }
      }),
    );
  }
}
