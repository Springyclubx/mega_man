import 'package:flutter/material.dart';
import 'package:harry_potter/domain/interfaces/application_interface.dart';
import 'package:harry_potter/domain/usecases/aplication_usecase.dart';
import 'package:harry_potter/infrastructure/data_store/repository/application_respository.dart';
import 'package:harry_potter/infrastructure/data_store/repository/webservice/harry_potter_webservice.dart';
import 'infrastructure/presentation/application.dart';

late final ApplicationUseCase applicationUseCase;

void main() {
  final harryPotterWS = HarryPotterWebService();
  final applicationRepository = newApplicationRepository(harryPotterWS);
  applicationUseCase = newApplicationUseCase(applicationRepository);


  runApp(const Application());
}
