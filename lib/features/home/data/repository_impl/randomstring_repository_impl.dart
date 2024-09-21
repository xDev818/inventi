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
