import 'package:flutter/material.dart';
import 'package:harry_potter/extension/context.dart';
import 'package:harry_potter/infrastructure/presentation/application.dart';
import 'package:harry_potter/infrastructure/presentation/states/details_state.dart';
import 'package:harry_potter/infrastructure/presentation/util/date_time_format.dart';
import 'package:harry_potter/infrastructure/presentation/util/widget/scafold_default.dart';
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
      child: ScafoldDefault(
        title: context.s.details,
        body: Details(image: image),
      ),
    );
  }
}

class Details extends StatelessWidget {
  const Details({super.key, this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<DetailsState>(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (image != null)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Hero(
                tag: image!,
                child: Image.network(
                  image!,
                  height: 300,
                  width: 220,
                  fit: BoxFit.fitHeight,
                  errorBuilder: (_, __, ___) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: Colors.white,
                    );
                  },
                ),
              ),
            ),

          if (!state.isLoading) ...[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: state.wizard.name,
                      style: textDefault.title,
                    ),
                    WidgetSpan(
                      child: Icon(
                        state.wizard.gender == Gender.male
                            ? Icons.male
                            : Icons.female,
                        color: context.isDarkTheme
                            ? Colors.white
                            : Colors.black,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (state.wizard.birthDate != null)
              _TextDefaultWidget(
                '${context.s.birthDate}: ${tryFormatDate(DateFormatNamed.dateFormat, state.wizard.birthDate)}',
              ),
            if (state.wizard.house != null)
              _TextDefaultWidget(
                '${context.s.house}: ${state.wizard.house!.name}',
              ),
            if (state.wizard.wand != null) ...[
              _TextDefaultWidget('${context.s.wand}:'),
              if (state.wizard.wand?.core != null &&
                  state.wizard.wand?.core != '')
                _TextDefaultWidget('•${state.wizard.wand!.core}'),
              if (state.wizard.wand?.length != null)
                _TextDefaultWidget('•${state.wizard.wand!.length}'),
              if (state.wizard.wand?.wood != null &&
                  state.wizard.wand?.wood != '')
                _TextDefaultWidget('•${state.wizard.wand!.wood}'),
            ],
            _TextDefaultWidget('${context.s.species}: ${state.wizard.specie}'),
            if (state.wizard.ancestry != null && state.wizard.ancestry != '')
              _TextDefaultWidget(
                '${context.s.ancestry}: ${state.wizard.ancestry}',
              ),
            if (state.wizard.hairColour != null &&
                state.wizard.hairColour != '')
              _TextDefaultWidget(
                '${context.s.hairColour}: ${state.wizard.hairColour}',
              ),
            if (state.wizard.eyeColour != null && state.wizard.eyeColour != '')
              _TextDefaultWidget(
                '${context.s.eyeColour}: ${state.wizard.eyeColour}',
              ),
            if (state.wizard.patronus != null && state.wizard.patronus != '')
              _TextDefaultWidget(
                '${context.s.patronus}: ${state.wizard.patronus}',
              ),
            if (state.wizard.alive != null)
              _TextDefaultWidget(
                '${context.s.status}: ${state.wizard.alive! ? context.s.alive : context.s.died}',
              ),
          ],
        ],
      ),
    );
  }
}

class _TextDefaultWidget extends StatelessWidget {
  const _TextDefaultWidget(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(text, style: TextStyle(fontSize: 30)),
    );
  }
}
