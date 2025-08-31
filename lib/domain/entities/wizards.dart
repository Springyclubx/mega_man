class Wizards {
  Wizards({
    required this.id,
    required this.name,
    required this.specie,
    required this.gender,
    this.birthDate,
    this.image,
    this.house,
  });

  final String id;
  final String name;
  final String specie;
  final Gender gender;
  final DateTime? birthDate;
  final String? image;
  final House? house;
}

enum Gender { male, female }

enum House { gryffindor, ravenclaw, slytherin, hufflepuff }

class WizardsDetails {
  WizardsDetails({
    required this.id,
    required this.name,
    required this.specie,
    required this.gender,
    required this.alternateNames,
    this.birthDate,
    this.image,
    this.house,
    this.wand,
    this.ancestry,
    this.hairColour,
    this.eyeColour,
    this.patronus,
    this.alive,
  });

  final String id;
  final String name;
  final String specie;
  final Gender gender;
  final DateTime? birthDate;
  final String? image;
  final House? house;
  final List<String> alternateNames;
  final Wand? wand;
  final String? ancestry;
  final String? hairColour;
  final String? eyeColour;
  final String? patronus;
  final bool? alive;
}

class Wand {
  Wand(this.wood, this.core, this.length);

  final String? wood;
  final String? core;
  final double? length;
}
