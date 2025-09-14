import 'package:uyjoy/core/either/either.dart';
import 'package:uyjoy/core/usecase/usecase.dart';
import 'package:uyjoy/features/home/data/model/property_model.dart';
import 'package:uyjoy/features/home/domain/repository/home_repository.dart';

import '../../../../core/error/failure.dart';

class HomeGetHousesUsecase extends UseCase<PropertyModel, NoParams> {
  final HomeRepository homeRepository;

  HomeGetHousesUsecase(this.homeRepository);

  @override
  Future<Either<Failure, PropertyModel>> call(NoParams param) {
    return homeRepository.getHouses();
  }
}
