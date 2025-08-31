import 'package:flutter/material.dart';
import 'package:harry_potter/extension/context.dart';

import '../../application.dart';

class ScafoldDefault extends StatelessWidget {
  const ScafoldDefault({super.key, this.title, required this.body});

  final String? title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title == null
          ? null
          : AppBar(
              backgroundColor: colorDefault.cardColor,
              centerTitle: true,
              title: Text(
                title!,
                style: context.typography.titleLarge?.copyWith(
                  fontSize: 32,
                  color: colorDefault.textColor,
                ),
              ),
            ),
      backgroundColor: colorDefault.backgraundColor,
      body: body,
    );
  }
}
