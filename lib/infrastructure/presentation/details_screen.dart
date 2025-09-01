import 'package:flutter/material.dart';
import 'package:harry_potter/extension/context.dart';
import 'package:harry_potter/infrastructure/presentation/application.dart';
import 'package:harry_potter/infrastructure/presentation/states/details_state.dart';
import 'package:harry_potter/infrastructure/presentation/util/widget/image.dart';
import 'package:harry_potter/infrastructure/presentation/util/widget/scaffold_default.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/wizards.dart';
import '../../main.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.id, this.image});

  final String id;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailsState(applicationUseCase, id),
      child: Consumer<DetailsState>(
        builder: (_, state, _) {
          return ScaffoldDefault(
            isLoading: state.isLoading,
            title: context.s.details,
            body: Details(image: image),
          );
        },
      ),
    );
  }
}

class Details extends StatelessWidget {
  const Details({super.key, this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    final list = body(context);
    return ListView.separated(
      itemBuilder: (context, index) {
        final item = list[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: item,
        );
      },
      separatorBuilder: (context, index) {
        return Divider(height: 1);
      },
      itemCount: list.length,
    );
  }

  List<Widget> body(BuildContext context) {
    final state = Provider.of<DetailsState>(context);

    return [
      if ((image ?? '').isNotEmpty)
        ImageDefault(image: image!, height: 300, width: 220),
      if (state.isLoading)
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Center(
              child: CircularProgressIndicator(color: colorDefault.textColor),
            ),
          ),
        )
      else ...[
        Row(
          children: [
            Text(state.wizard.name, style: textDefault.title),
            Icon(
              state.wizard.gender.icon,
              color: colorDefault.textColor,
              size: 40,
            ),
          ],
        ),
        if (state.wizard.birthDate != null)
          _TextLegendDefaultWidget(
            legend: context.s.birthDate,
            text: state.wizard.birthDateFormat,
          ),
        if (state.wizard.house != null)
          _TextLegendDefaultWidget(
            legend: context.s.house,
            text: state.wizard.house!.name,
          ),

        _TextLegendDefaultWidget(
          legend: context.s.species,
          text: state.wizard.specie,
        ),
        if (state.wizard.ancestry != null && state.wizard.ancestry != '')
          _TextLegendDefaultWidget(
            legend: context.s.ancestry,
            text: state.wizard.ancestry!,
          ),
        if (state.wizard.hairColour != null && state.wizard.hairColour != '')
          _TextLegendDefaultWidget(
            legend: context.s.hairColour,
            text: state.wizard.hairColour!,
          ),
        if (state.wizard.eyeColour != null && state.wizard.eyeColour != '')
          _TextLegendDefaultWidget(
            legend: context.s.eyeColour,
            text: state.wizard.eyeColour!,
          ),
        if (state.wizard.patronus != null && state.wizard.patronus != '')
          _TextLegendDefaultWidget(
            legend: context.s.patronus,
            text: state.wizard.patronus!,
          ),
        if (state.wizard.alive != null)
          _TextLegendDefaultWidget(
            legend: context.s.status,
            text: state.wizard.alive! ? context.s.alive : context.s.died,
          ),

        if (state.wizard.wand != null) _WizardWand(wand: state.wizard.wand!),
      ],
    ];
  }
}

class _WizardWand extends StatelessWidget {
  const _WizardWand({required this.wand});

  final Wand wand;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TextDefaultWidget(text: context.s.wand),
        if (wand.core != null && wand.core != '')
          _TextDefaultWidget(text: '${wand.core}'),
        if (wand.wood != null && wand.wood != '')
          _TextDefaultWidget(text: '${wand.wood}'),
      ],
    );
  }
}

class _TextLegendDefaultWidget extends StatelessWidget {
  const _TextLegendDefaultWidget({required this.legend, required this.text});

  final String legend;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$legend: $text',
      style: TextStyle(fontSize: 30, color: colorDefault.textColor),
    );
  }
}

class _TextDefaultWidget extends StatelessWidget {
  const _TextDefaultWidget({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 30, color: colorDefault.textColor),
    );
  }
}
