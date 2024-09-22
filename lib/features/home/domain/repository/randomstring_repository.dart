// Date : Sept 21, 2024
// Author : RLP
// Purpose :  Defines the contract for data operations. Fetch the Random String
//          It specifies what methods are available without detailing how these methods
//          implemented

import 'package:inventi/features/home/domain/entities/raandomstring_entity.dart';

abstract class RandomstringRepository {
  Future<List<RandomStringEntity>> getRandomString();
}
