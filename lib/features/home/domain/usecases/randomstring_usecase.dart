// Date : Sept 21, 2024
// Author : RLP
// Purpose : Use cases provide a clear interface for the actions that can be performed within the
//          application. They typically expose methods that correspond to specific business
//          actions (e.g., LoginUser, Fetch Random String).
//

import 'package:dartz/dartz.dart';
import 'package:inventi/core/errors/failures.dart';
import 'package:inventi/core/usecases/usecases.dart';
import 'package:inventi/features/home/domain/entities/raandomstring_entity.dart';
import 'package:inventi/features/home/domain/repository/randomstring_repository.dart';

class RandomStringUsecase
    extends UseCases<List<RandomStringEntity>, UserParams> {
  final RandomstringRepository randomStringRepository;

  RandomStringUsecase(this.randomStringRepository);

  @override
  Future<Either<Failure, List<RandomStringEntity>>> call(
      UserParams params) async {
    try {
      final randomString = await randomStringRepository.getRandomString();
      return Right(randomString);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}

/// Preparation for UserParams when token or
/// userid is needed later
class UserParams {
  // final String userId;
  final String token;

  UserParams({required this.token});
}
