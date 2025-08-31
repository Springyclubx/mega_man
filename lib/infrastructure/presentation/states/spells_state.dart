import 'package:flutter/cupertino.dart';
import 'package:harry_potter/domain/entities/spell.dart';
import 'package:harry_potter/domain/interfaces/application_interface.dart';

class SpellsState extends ChangeNotifier {
  SpellsState(this._useCase) {
    _init();
  }

  final ApplicationUseCase _useCase;

  TextEditingController searchController = TextEditingController();

  final list = <Spell>[];
  bool isLoading = true;

  void _init() async {
    try {
      list
        ..clear()
        ..addAll(await _useCase.getAllSpells());
    } on Exception {
      list.clear();
    }

    isLoading = false;
    notifyListeners();
  }

  void filter() async {
    isLoading = true;
    notifyListeners();

    final text = searchController.text;

    if (text == '') {
      list
        ..clear()
        ..addAll(await _useCase.getAllSpells());

      isLoading = false;
      notifyListeners();

      return;
    }

    final filtered = list.where((element) {
      return (removeDiacritics(
        element.name,
      )).toLowerCase().contains(text.toLowerCase());
    }).toList();

    list
      ..clear()
      ..addAll(filtered);

    isLoading = false;
    notifyListeners();
  }
}

/// remove Diacritics
String removeDiacritics(String str) {
  var withDia =
      'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
  var withoutDia =
      'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

  for (var i = 0; i < withDia.length; i++) {
    str = str.replaceAll(withDia[i], withoutDia[i]);
  }

  return str;
}
