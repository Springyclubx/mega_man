import '../../../../domain/entities/spell.dart';
import '../../../../domain/entities/wizards.dart';

///Interface that deal with the user information
abstract class ApplicationRepository {
  Future<List<Wizards>> getAllWizards();

  Future<List<Wizards>> getAllWizardsByHouse(House house);

  Future<WizardsDetails> getDetailsWizard(String id);

  Future<List<Spell>> getAllSpells();
}
