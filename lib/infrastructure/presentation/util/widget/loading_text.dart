import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../application.dart';

class LoadingText extends StatelessWidget {
  const LoadingText(this.width, this.fontSize, {super.key});

  final double width;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Container(
        color: colorDefault.cardColor,
        width: width,
        height: fontSize,
      ),
    );
  }
}
