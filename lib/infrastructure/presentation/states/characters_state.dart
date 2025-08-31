import 'package:flutter/cupertino.dart';
import 'package:harry_potter/domain/entities/wizards.dart';
import 'package:harry_potter/domain/interfaces/application_interface.dart';

class CharactersState extends ChangeNotifier {
  CharactersState(this._useCase, this.house) {
    _init();
  }

  final ApplicationUseCase _useCase;
  final House? house;

  final list = <Wizards>[];
  bool isLoading = true;
  House? selected;

  void _init() async {
    try {
      if (house == null) {
        list
          ..clear()
          ..addAll(await _useCase.getAllWizards());
      } else {
        list
          ..clear()
          ..addAll(await _useCase.getAllWizardsByHouse(house!));
      }
    } on Exception {
      list.clear();
    }

    isLoading = false;
    notifyListeners();
  }

  void filter(House? house) async {
    isLoading = true;
    notifyListeners();

    if (house == null) {
      selected = null;
      list
        ..clear()
        ..addAll(await _useCase.getAllWizards());

      isLoading = false;
      notifyListeners();
      return;
    }

    if (house == selected) {
      selected = null;

      list
        ..clear()
        ..addAll(await _useCase.getAllWizards());

      isLoading = false;
      notifyListeners();
      return;
    }

    selected = house;
    list
      ..clear()
      ..addAll(await _useCase.getAllWizardsByHouse(house));

    isLoading = false;
    notifyListeners();
  }
}
