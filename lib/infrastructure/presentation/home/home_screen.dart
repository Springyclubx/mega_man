import 'package:flutter/material.dart';
import 'package:harry_potter/extension/context.dart';
import 'package:harry_potter/infrastructure/presentation/routes/routes.dart';
import 'package:harry_potter/infrastructure/presentation/util/border.dart';
import '../application.dart';
import '../util/widget/scafold_default.dart';

part 'widgets/container_home_default.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return ScafoldDefault(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only( bottom: 60),
                  child: Text(
                    'Harry Potter',
                    style: TextStyle(
                      fontSize: 100,
                      color: colorDefault.textColor,
                    ),
                  ),
                ),
                Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _ContainerHomeDefault(
                      icon: Icons.home,
                      text: context.s.houses,
                      route: NamedRoutes.houses,
                    ),
                    _ContainerHomeDefault(
                      icon: Icons.star_sharp,
                      text: context.s.spells,
                      route: NamedRoutes.spells,
                    ),
                  ],
                ),
                _ContainerHomeDefault(
                  icon: Icons.person,
                  text: context.s.characters,
                  route: NamedRoutes.characters,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
