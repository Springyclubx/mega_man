import 'package:harry_potter/domain/entities/spell.dart';
import 'package:harry_potter/domain/entities/wizards.dart';
import 'package:harry_potter/infrastructure/data_store/repository/webservice/harry_potter_webservice.dart';
import 'package:harry_potter/infrastructure/presentation/util/date_time_format.dart';
import 'interface/application_repository_interface.dart';

/// Initialize a database class to deal with list users
ApplicationRepository newApplicationRepository(
  HarryPotterWebService harryPotterWS,
) {
  return _ApplicationRepository(harryPotterWS);
}

class _ApplicationRepository implements ApplicationRepository {
  const _ApplicationRepository(this._harryPotterWebService);

  final HarryPotterWebService _harryPotterWebService;

  @override
  Future<List<Wizards>> getAllWizards() async {
    try {
      final response = await _harryPotterWebService.getAllWizards();

      if (response == null) {
        return [];
      }

      final list = <Wizards>[];

      for (final item in response) {
        late House? house;

        switch (item['house']) {
          case 'Gryffindor':
            house = House.gryffindor;
            break;
          case 'Slytherin':
            house = House.slytherin;
            break;
          case 'Hufflepuff':
            house = House.hufflepuff;
            break;
          case 'Ravenclaw':
            house = House.ravenclaw;
            break;
          default:
            house = null;
        }

        list.add(
          Wizards(
            id: item['id'],
            name: item['name'],
            specie: item['species'],
            gender: item['gender'] == 'male' ? Gender.male : Gender.female,
            birthDate: tryParseDate('dd-MM-yyyy', item['dateOfBirth']),
            image: item['image'],
            house: house,
          ),
        );
      }

      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Wizards>> getAllWizardsByHouse(House house) async {
    try {
      final response = await _harryPotterWebService.getAllWizardsByHouse(house);

      if (response == null) {
        return [];
      }

      final list = <Wizards>[];

      for (final item in response) {
        list.add(
          Wizards(
            id: item['id'],
            name: item['name'],
            specie: item['species'],
            gender: item['gender'] == 'male' ? Gender.male : Gender.female,
            birthDate: tryParseDate('dd-MM-yyyy', item['dateOfBirth']),
            image: item['image'],
            house: house,
          ),
        );
      }

      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<WizardsDetails> getDetailsWizard(String id) async {
    final response = await _harryPotterWebService.getDetailsWizard(id);

    if (response == null) {
      throw Exception('Wizard not found');
    }

    final item = response.first;

    late House? house;

    switch (item['house']) {
      case 'Gryffindor':
        house = House.gryffindor;
        break;
      case 'Slytherin':
        house = House.slytherin;
        break;
      case 'Hufflepuff':
        house = House.hufflepuff;
        break;
      case 'Ravenclaw':
        house = House.ravenclaw;
        break;
      default:
        house = null;
    }

    Wand? wand;

    if (item['wand'] != null) {
      final wandDetails = item['wand'];

      if (wandDetails['wood'] == '' &&
          wandDetails['core'] == '' &&
          wandDetails['length'] == null) {
        wand = null;
      } else {
        wand = Wand(
          wandDetails['wood'],
          wandDetails['core'],
          double.tryParse(wandDetails['length'].toString()),
        );
      }
    }

    return WizardsDetails(
      id: item['id'],
      name: item['name'],
      specie: item['species'],
      gender: item['gender'] == 'male' ? Gender.male : Gender.female,
      birthDate: tryParseDate('dd-MM-yyyy', item['dateOfBirth']),
      image: item['image'],
      house: house,
      alternateNames: [for (final it in item['alternate_names']) it.toString()],
      alive: item['alive'],
      ancestry: item['ancestry'],
      eyeColour: item['eyeColour'],
      hairColour: item['hairColour'],
      patronus: item['patronus'],
      wand: wand,
    );
  }

  @override
  Future<List<Spell>> getAllSpells() async {
    try {
      final response = await _harryPotterWebService.getAllSpells();

      if (response == null) {
        return [];
      }

      final list = <Spell>[];

      for (final item in response) {
        list.add(
          Spell(
            id: item['id'],
            name: item['name'],
            description: item['description'],
          ),
        );
      }

      return list;
    } catch (e) {
      rethrow;
    }
  }
}
