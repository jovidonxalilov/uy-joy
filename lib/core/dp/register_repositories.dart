import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:uyjoy/features/home/data/datasource/home_datasource.dart';
import 'package:uyjoy/features/home/domain/repository/home_repository.dart';

import '../../features/auth/data/datasource/auth_datasource.dart';
import '../../features/auth/domain/repository/auth_repository.dart';

Future<void> registerRepositories(GetIt getIt) async {
  getIt
    ..registerLazySingleton(() => AuthRepository(getIt<AuthDatasource>()))
    ..registerLazySingleton(() => HomeRepository(getIt<HomeDatasourse>()));
  log("Register Repositories Complate For GetIT");
}
