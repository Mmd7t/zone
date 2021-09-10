import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductRateCard extends StatelessWidget {
  final String rate;
  final String countRate;

  const ProductRateCard({Key key, this.rate, this.countRate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1.2),
        color: Get.theme.colorScheme.secondary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomRateBar(rate: 5, size: 30),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$rate " + "من 5 نجوم",
                style: Get.textTheme.subtitle1.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "($countRate تقيم)",
                style: Get.textTheme.caption.copyWith(
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

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
      color: Color(0xFFFFB007),
      borderColor: Color(0xFFE6E6E6),
      spacing: -3,
    );
  }
}
