import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:harry_potter/infrastructure/presentation/routes/routes.dart';
import 'package:harry_potter/infrastructure/presentation/util/color_default.dart';
import 'package:harry_potter/infrastructure/presentation/util/text_default.dart';

import '../../generated/l10n.dart';
import 'home/home_screen.dart';

late final ColorDefault colorDefault;
late final TextDefault textDefault;
bool _isColorDefaultInitialized = false;

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    if (!_isColorDefaultInitialized) {
      _init(context);
    }

    final defaultTransition = SharedAxisPageTransitionsBuilder(
      transitionType: SharedAxisTransitionType.horizontal,
    );

    final allTargetPlatform = TargetPlatform.values;
    final builders = <TargetPlatform, PageTransitionsBuilder>{};

    for (final item in allTargetPlatform) {
      builders[item] = defaultTransition;
    }

    return MaterialApp(
      initialRoute: NamedRoutes.home,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: builders),
        fontFamily: 'HarryPotter',
        iconTheme: IconThemeData(color: ColorDefault.textColorLight),
        colorScheme: ColorScheme.fromSeed(
          primary: ColorDefault.textColorLight,
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: builders),
        fontFamily: 'HarryPotter',
        iconTheme: IconThemeData(color: ColorDefault.textColorDark),
        colorScheme: ColorScheme.fromSeed(
          primary: ColorDefault.textColorDark,
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      routes: MainRoute.routes,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const HomePageScreen(),
    );
  }

  void _init(BuildContext context) {
    colorDefault = ColorDefault(context: context);
    textDefault = TextDefault(context: context);
    _isColorDefaultInitialized = true;
  }
}
