import 'package:uyjoy/core/either/either.dart';
import 'package:uyjoy/core/error/failure.dart';
import 'package:uyjoy/features/home/data/datasource/home_datasource.dart';
import 'package:uyjoy/features/home/data/model/property_model.dart';
import 'package:uyjoy/features/home/data/repository_impl/home_repository_impl.dart';

abstract class HomeRepository {
  Future<Either<Failure, PropertyModel>> getHouses();

  factory HomeRepository(HomeDatasourse homeDataSource) =>
      HomeRepositoryImpl(homeDataSource: homeDataSource);
}