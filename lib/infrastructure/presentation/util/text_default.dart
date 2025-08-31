import 'package:flutter/material.dart';
import 'package:harry_potter/extension/context.dart';

import '../application.dart';

class TextDefault {
  TextDefault({required this.context});

  final BuildContext context;

  TextStyle get title => context.typography.titleLarge!.copyWith(
    fontSize: 32,
    color: colorDefault.textColor,
    fontFamily: 'HarryPotter',
  );

  TextStyle get body => context.typography.bodyLarge!.copyWith(
    fontSize: 26,
    color: colorDefault.textColor,
    fontFamily: 'HarryPotter',
  );
}
