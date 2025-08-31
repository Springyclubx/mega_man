import 'package:flutter/material.dart';
import 'package:harry_potter/domain/entities/wizards.dart';
import 'package:harry_potter/domain/interfaces/application_interface.dart';

class DetailsState extends ChangeNotifier {
  DetailsState(this._useCase, this._id) {
    _init();
  }

  final ApplicationUseCase _useCase;
  final String _id;

  late WizardsDetails wizard;
  bool isLoading = true;

  void _init() async {
    wizard = await _useCase.getDetailsWizard(_id);

    isLoading = false;
    notifyListeners();
  }
}
