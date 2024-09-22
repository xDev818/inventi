// Date : Sept 21, 2024
// Author : RLP
// Purpose : Connect to API and receive response

// Date : Sept 22, 2024
// Author : RLP
// Purpose : During the Test in browser there is a Dio error response regarding CORS Policy on
//          chrome browser.
//          When it run on android mobile device there is no issue, the response is OK. Only in
//          chrome browser testing.

import 'package:dio/dio.dart';
import 'package:inventi/config/api_constants.dart';
import 'package:inventi/features/home/data/models/randomstring_model.dart';
import 'package:inventi/features/home/domain/entities/raandomstring_entity.dart';

class RandomstringRemoteDatasource {
  final Dio dio;

  RandomstringRemoteDatasource({required this.dio});

  Future<List<RandomStringEntity>> getRandomString() async {
    const String apiUrl = AppApi.apiURL;

    try {
      final response = await dio.get(apiUrl,
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ));

      if (response.statusCode == 200) {
        // Directly access the random string
        final String randomString = response.data['randomString'];

        // Create a list with a single RandomStringEntity
        return [RandomStringModel(randomString: randomString)];
      } else {
        throw Exception(
            'Failed to load random string, status code: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      // Handle Dio-specific errors
      String errorMessage;
      if (dioError.response != null) {
        errorMessage = 'Failed to get random string: ${dioError.message}';
      } else {
        errorMessage = dioError.message.toString();
      }
      throw Exception(errorMessage);
    } catch (err) {
      print('General Exception: $err');
      throw Exception('An unexpected error occurred: $err');
    }
  }
}
