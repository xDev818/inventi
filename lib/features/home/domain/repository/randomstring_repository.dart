import 'package:inventi/features/home/domain/entities/raandomstring_entity.dart';

abstract class RandomstringRepository {
  Future<List<RandomStringEntity>> getRandomString();
}
