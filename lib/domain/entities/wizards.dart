import 'package:flutter/material.dart';

import '../../infrastructure/presentation/util/date_time_format.dart';

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

  String get birthDateFormat =>
      tryFormatDate(DateFormatNamed.dateFormat, birthDate) ?? '';

  static Wizards fromJson(Map<String, dynamic> json, House? house) {
    return Wizards(
      id: json['id'],
      name: json['name'],
      specie: json['species'],
      gender: json['gender'] == 'male' ? Gender.male : Gender.female,
      birthDate: tryParseDate('dd-MM-yyyy', json['dateOfBirth']),
      image: json['image'],
      house: House.fromValue(json['house']),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'species': specie,
    'gender': gender.name,
  };
}

enum Gender {
  male(Icons.male),
  female(Icons.female);

  const Gender(this.icon);

  final IconData icon;
}

enum House {
  gryffindor('gryffindor'),
  ravenclaw('ravenclaw'),
  slytherin('slytherin'),
  hufflepuff('hufflepuff');

  final String valueApi;

  const House(this.valueApi);

  static House fromValue(String? value) {
    return House.values.firstWhere(
      (house) => house.valueApi == value?.toLowerCase(),
    );
  }
}

class WizardsDetails extends Wizards {
  WizardsDetails({
    required super.id,
    required super.name,
    required super.specie,
    required super.gender,
    super.birthDate,
    super.image,
    super.house,
    required this.alternateNames,
    this.wand,
    this.ancestry,
    this.hairColour,
    this.eyeColour,
    this.patronus,
    this.alive,
  });

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
