// ignore: dangling_library_doc_comments
/// Date : Sept 21, 2024
///
/// Purpose : core usecase
///           reference in other
///           ojects that requires usecase
import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

abstract class UseCases<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
