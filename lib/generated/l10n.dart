// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;
 
      return instance;
    });
  } 

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Unexpected error, please try again later`
  String get unknownError {
    return Intl.message(
      'Unexpected error, please try again later',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Characters`
  String get characters {
    return Intl.message(
      'Characters',
      name: 'characters',
      desc: '',
      args: [],
    );
  }

  /// `Houses`
  String get houses {
    return Intl.message(
      'Houses',
      name: 'houses',
      desc: '',
      args: [],
    );
  }

  /// `House`
  String get house {
    return Intl.message(
      'House',
      name: 'house',
      desc: '',
      args: [],
    );
  }

  /// `Wand`
  String get wand {
    return Intl.message(
      'Wand',
      name: 'wand',
      desc: '',
      args: [],
    );
  }

  /// `Species`
  String get species {
    return Intl.message(
      'Species',
      name: 'species',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Ancestry`
  String get ancestry {
    return Intl.message(
      'Ancestry',
      name: 'ancestry',
      desc: '',
      args: [],
    );
  }

  /// `Hair color`
  String get hairColour {
    return Intl.message(
      'Hair color',
      name: 'hairColour',
      desc: '',
      args: [],
    );
  }

  /// `Eye color`
  String get eyeColour {
    return Intl.message(
      'Eye color',
      name: 'eyeColour',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Patronus`
  String get patronus {
    return Intl.message(
      'Patronus',
      name: 'patronus',
      desc: '',
      args: [],
    );
  }

  /// `Died`
  String get died {
    return Intl.message(
      'Died',
      name: 'died',
      desc: '',
      args: [],
    );
  }

  /// `Alive`
  String get alive {
    return Intl.message(
      'Alive',
      name: 'alive',
      desc: '',
      args: [],
    );
  }

  /// `Birth date`
  String get birthDate {
    return Intl.message(
      'Birth date',
      name: 'birthDate',
      desc: '',
      args: [],
    );
  }

  /// `Spells`
  String get spells {
    return Intl.message(
      'Spells',
      name: 'spells',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}