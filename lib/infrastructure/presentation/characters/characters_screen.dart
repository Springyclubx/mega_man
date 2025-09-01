import 'package:flutter/material.dart';
import 'package:harry_potter/domain/entities/wizards.dart';
import 'package:harry_potter/extension/context.dart';
import 'package:harry_potter/infrastructure/presentation/routes/routes.dart';
import 'package:harry_potter/infrastructure/presentation/states/characters_state.dart';
import 'package:harry_potter/infrastructure/presentation/util/border.dart';
import 'package:harry_potter/infrastructure/presentation/util/widget/loading_text.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../../main.dart';
import '../application.dart';
import '../util/widget/image.dart';
import '../util/widget/scaffold_default.dart';

part 'filter_widget.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({super.key, this.house});

  final House? house;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CharactersState(applicationUseCase, house),
      child: ScaffoldDefault(
        title: context.s.characters,
        body: Column(
          children: [if (house == null) _Filters(), CharactersListView()],
        ),
      ),
    );
  }
}

class CharactersListView extends StatelessWidget {
  const CharactersListView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CharactersState>(context);
    if (state.isLoading) {
      return Expanded(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (_, index) {
            return WizardItemLoading();
          },
        ),
      );
    }

    return Expanded(
      child: ListView.builder(
        itemCount: state.list.length,
        itemBuilder: (_, index) {
          final wizard = state.list[index];
          return WizardItem(wizard: wizard);
        },
      ),
    );
  }
}

class WizardItem extends StatelessWidget {
  const WizardItem({super.key, required this.wizard});

  final Wizards wizard;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorDefault.cardColor,
      child: InkWell(
        borderRadius: BorderRadiusDefault.borderRadiusDefault,
        onTap: () async {
          await Navigator.of(context).pushNamed(
            NamedRoutes.details,
            arguments: {'id': wizard.id, 'image': wizard.image},
          );
        },
        child: Row(
          children: [
            if (wizard.image != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ImageDefault(
                  image: wizard.image!,
                  height: 100,
                  width: 100,
                ),
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Row(
                      children: [
                        Text(
                          wizard.name,
                          style: textDefault.body,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Icon(wizard.gender.icon, color: colorDefault.textColor),
                      ],
                    ),
                    if (wizard.birthDate != null)
                      _TextDefault(wizard.birthDateFormat),
                    if (wizard.house != null)
                      _TextDefault('${context.s.house}: ${wizard.house!.name}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WizardItemLoading extends StatelessWidget {
  const WizardItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorDefault.cardColor,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Shimmer(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: colorDefault.cardColor,
                  borderRadius: BorderRadiusDefault.borderRadiusDefault,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Row(children: [LoadingText(200, 18)]),
                  LoadingText(100, 18),
                  LoadingText(250, 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TextDefault extends StatelessWidget {
  const _TextDefault(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 18, color: colorDefault.textColor),
    );
  }
}
