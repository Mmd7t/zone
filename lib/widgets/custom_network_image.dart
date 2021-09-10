import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomNetworkImage extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final BoxFit fit;
  const CustomNetworkImage(
      {Key key, @required this.url, this.width, this.height, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return url == null
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/error.png",
            ),
          )
        : CachedNetworkImage(
            imageUrl: url,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider, fit: fit ?? BoxFit.fill),
                ),
              );
            },
            placeholder: (context, url) => LoadingImage(),
            errorWidget: (context, url, error) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/error.png",
              ),
            ),
          );
  }
}

class LoadingImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/lottie/loadingImage.json',
          width: double.infinity, height: double.infinity),
    );
  }
}
