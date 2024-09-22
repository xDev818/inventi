// Date : Sept 21, 2024
// Author : RLP
// Purpose :  Contains the actual logic for interacting with data sources (e.g., APIs, databases)
//          It provides the concrete implementation of the methods defined in the interface.
//          We can add new methods that interact from local to remote db connection without
//          affecting the entire application. Adapt the scalability purposes.

import 'package:inventi/features/home/data/datasources/remote/randomstring_remote_datasource.dart';
import 'package:inventi/features/home/domain/entities/raandomstring_entity.dart';
import 'package:inventi/features/home/domain/repository/randomstring_repository.dart';

class RandomstringRepositoryImpl extends RandomstringRepository {
  final RandomstringRemoteDatasource remotDataSource;

  RandomstringRepositoryImpl(this.remotDataSource);

  @override
  Future<List<RandomStringEntity>> getRandomString() async {
    return await remotDataSource.getRandomString();
  }
}
