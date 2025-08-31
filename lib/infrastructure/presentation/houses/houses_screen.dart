import 'package:flutter/material.dart';
import 'package:harry_potter/extension/context.dart';
import 'package:harry_potter/infrastructure/presentation/routes/routes.dart';
import 'package:harry_potter/infrastructure/presentation/util/border.dart';
import 'package:harry_potter/infrastructure/presentation/util/widget/scafold_default.dart';

import '../../../domain/entities/wizards.dart';
import '../../../generated/l10n.dart';
import '../application.dart';

part 'widgets/houses_container_default.dart';

class HousesScreen extends StatelessWidget {
  const HousesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScafoldDefault(
      title: context.s.houses,
      body: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _HousesContainer(house: House.gryffindor),
              _HousesContainer(house: House.slytherin),
            ],
          ),
          Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _HousesContainer(house: House.hufflepuff),
              _HousesContainer(house: House.ravenclaw),
            ],
          ),
        ],
      ),
    );
  }
}
