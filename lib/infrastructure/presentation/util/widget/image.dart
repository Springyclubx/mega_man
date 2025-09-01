import 'package:flutter/material.dart';

import '../border.dart';

class ImageDefault extends StatelessWidget {
  const ImageDefault({super.key, required this.image, required this.height, this.width});

  final double height;
  final double? width;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Hero(
        tag: image,
        child: ClipRRect(
          borderRadius: BorderRadiusDefault.borderRadiusDefault,
          child: Image.network(
            image,
            height: height,
            width: width,
            fit: BoxFit.fitHeight,
            errorBuilder: (_, __, ___) {
              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
