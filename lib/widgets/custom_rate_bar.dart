import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CustomRateBar extends StatelessWidget {
  final double size;
  final double rate;
  final Function(double) onRated;
  const CustomRateBar({Key key, this.size, this.rate, this.onRated})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SmoothStarRating(
        allowHalfRating: false,
        onRated: onRated,
        starCount: 5,
        rating: rate,
        size: size,
        defaultIconData: Icons.star_rounded,
        filledIconData: Icons.star_rounded,
        isReadOnly: onRated == null ? true : false,
        color: Color(0xFFFFC107),
        borderColor: Color(0xFFE6E6E6),
        spacing: -3);
  }
}
