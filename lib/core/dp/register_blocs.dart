import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:uyjoy/features/home/domain/usecase/home_usecase.dart';
import 'package:uyjoy/features/home/presentation/bloc/home_bloc.dart';

import '../../features/auth/domain/usecase/usecase.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

Future<void> registerBlocs(GetIt getIt) async {
  getIt
    ..registerFactory<AuthBloc>(
      () => AuthBloc(
        getIt<AuthLoginUsecase>(),
        getIt<AuthSentOtpUsecase>(),
        getIt<AuthVerifyOtpUsecase>(),
        getIt<AuthSignUpUsecase>(),
        getIt<AuthResetVerifyOtpUsecase>(),
        getIt<AuthResetPasswordUsecase>(),
        getIt<AuthResetSendOtpUsecase>(),
      ),
    )
    ..registerFactory<HomeBloc>(() => HomeBloc(getIt<HomeGetHousesUsecase>()));
  log("Register BLOC Complate For GetIT");
}
