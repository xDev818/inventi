// Date : Sept 21, 2024
// Author : RLP
// Purpose : DI separates the creation of an object from its usage. This means that components can
//          depend on abstractions (like interfaces) rather than concrete implementations, leading
//          to more flexible and reusable code.

//          It helps manage the dependencies of classes by providing instances of those
//          dependencies when needed, rather than having classes create their own dependencies.
//          This makes it easier to change implementations or configurations without altering the
//          dependent classes.

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:inventi/config/api_constants.dart';
import 'package:inventi/features/home/data/datasources/remote/randomstring_remote_datasource.dart';
import 'package:inventi/features/home/data/repository_impl/randomstring_repository_impl.dart';
import 'package:inventi/features/home/domain/repository/randomstring_repository.dart';
import 'package:inventi/features/home/domain/usecases/randomstring_usecase.dart';
import 'package:inventi/features/home/presentation/bloc/randomstring/random_string_bloc.dart';

final GetIt sl = GetIt.instance;

// void setupLocator() async {
Future<void> setupLocator() async {
  // centralized Dio
  // Date : Sept 21, 2024
  // Purpose : Centralized Dependency Injection

  sl.registerLazySingleton<Dio>(() {
    return Dio(
      BaseOptions(
        baseUrl: AppApi.apiURL,
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  });

  // Date :Sept 21, 2024
  // Register Repository, USecase, RemoteData Source
  sl.registerLazySingleton<RandomstringRepository>(() =>
      RandomstringRepositoryImpl(RandomstringRemoteDatasource(dio: sl<Dio>())));

  // Register the use case
  sl.registerLazySingleton<RandomStringUsecase>(
      () => RandomStringUsecase(sl<RandomstringRepository>()));

// Register randomStringBloc
  sl.registerFactory<RandomStringBloc>(
    () => RandomStringBloc(getRandomStringUsecase: sl<RandomStringUsecase>()),
  );
}
