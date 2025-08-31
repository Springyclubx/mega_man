import 'package:harry_potter/domain/entities/spell.dart';
import 'package:harry_potter/domain/entities/wizards.dart';

import '../../infrastructure/data_store/repository/interface/application_repository_interface.dart';
import '../interfaces/application_interface.dart';

/// All business rules for employee
ApplicationUseCase newApplicationUseCase(ApplicationRepository repository) {
  return _ApplicationInterface(repository);
}

class _ApplicationInterface extends ApplicationUseCase {
  _ApplicationInterface(this._repository);

  final ApplicationRepository _repository;

  @override
  Future<List<Wizards>> getAllWizards() => _repository.getAllWizards();

  @override
  Future<List<Wizards>> getAllWizardsByHouse(House house) =>
      _repository.getAllWizardsByHouse(house);

  @override
  Future<WizardsDetails> getDetailsWizard(String id) =>
      _repository.getDetailsWizard(id);

  @override
  Future<List<Spell>> getAllSpells() => _repository.getAllSpells();
}
