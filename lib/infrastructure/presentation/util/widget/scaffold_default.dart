import 'package:flutter/material.dart';
import 'package:harry_potter/extension/context.dart';
import 'package:harry_potter/infrastructure/presentation/util/widget/loading_text.dart';

import '../../application.dart';

class ScaffoldDefault extends StatelessWidget {
  const ScaffoldDefault({
    super.key,
    this.title,
    required this.body,
    this.isLoading = false,
  });

  final String? title;
  final Widget body;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title == null
          ? null
          : AppBar(
              backgroundColor: colorDefault.cardColor,
              centerTitle: true,
              iconTheme: IconThemeData(color: colorDefault.textColor),
              title: isLoading
                  ? LoadingText(140,32)
                  : Text(
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

