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
  bool _isLoading = true;
  House? _selected;

  bool get isLoading => _isLoading;
  House? get selected => _selected;

  void _init() async {
    await getAllWizards(house);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> getAllWizards(House? house) async {
    try {
      list
        ..clear()
        ..addAll(await _useCase.getAllWizards(house));
    } on Exception {
      list.clear();
    }
  }

  Future<void> filter(House? house) async {
    _isLoading = true;
    _selected = house;
    notifyListeners();

    getAllWizards(house);

    _isLoading = false;
    notifyListeners();
  }
}
