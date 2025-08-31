import 'package:harry_potter/domain/entities/wizards.dart';
import '../entities/spell.dart';

///Deal with business rules of user information
abstract class ApplicationUseCase {
  Future<List<Wizards>> getAllWizards();

  Future<List<Wizards>> getAllWizardsByHouse(House house);

  Future<WizardsDetails> getDetailsWizard(String id);

  Future<List<Spell>> getAllSpells();
}
