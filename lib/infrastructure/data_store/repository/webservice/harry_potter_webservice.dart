import 'dart:convert';

import 'package:harry_potter/domain/excepction/api_response_exception.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../../domain/entities/wizards.dart';

/// Maps all the required http request to the endpoints
class HarryPotterWebService {
  Future<List<dynamic>?> getAllWizards() async {
    final uri = Uri.parse('https://hp-api.onrender.com/api/characters');
    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        logFail(response, uri.path);
        throw ApiResponseException(response);
      }

      logSuccess(uri.path, 'Get all the wizards');
      return jsonDecode(response.body);
    } on Exception {
      return null;
    }
  }

  Future<List<dynamic>?> getAllWizardsByHouse(House house) async {
    final uri = Uri.parse('https://hp-api.onrender.com/api/characters/house/${house.name}');
    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        logFail(response, uri.path);
        throw ApiResponseException(response);
      }

      logSuccess(uri.path, 'Get all the wizards of the ${house.name} house');
      return jsonDecode(response.body);
    } on Exception {
      return null;
    }
  }

  Future<List<dynamic>?> getDetailsWizard(String id) async{
    final uri = Uri.parse('https://hp-api.onrender.com/api/character/$id');
    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        logFail(response, uri.path);
        throw ApiResponseException(response);
      }

      logSuccess(uri.path, 'Get the details of a wizard');
      return jsonDecode(response.body);
    } on Exception {
      return null;
    }
  }

  Future<List<dynamic>?> getAllSpells() async {
    final uri = Uri.parse('https://hp-api.onrender.com/api/spells');
    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        logFail(response, uri.path);
        throw ApiResponseException(response);
      }

      logSuccess(uri.path, 'Get all the spells');
      return jsonDecode(response.body);
    } on Exception {
      return null;
    }
  }

}

/// Print a fail request message
void logFail(http.Response response, String path) {
  Logger(
    output: ConsoleOutput(),
    printer: PrettyPrinter(printTime: true, colors: true),
  ).e('$path: ${response.body}');
}

/// Print a success request message
void logSuccess(String path, String description) {
  Logger(
    output: ConsoleOutput(),
    printer: PrettyPrinter(printTime: true, colors: true),
  ).i('$path: $description');
}

/// Print a exception request message
void logException(String path, Exception e) {
  Logger(
    output: ConsoleOutput(),
    printer: PrettyPrinter(printTime: true, colors: true),
  ).f('$path: $e');
}
