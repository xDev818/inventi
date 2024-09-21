import 'package:inventi/features/home/domain/entities/raandomstring_entity.dart';

class RandomStringModel extends RandomStringEntity {
  RandomStringModel({required String randomString})
      : super(randomString: randomString);

  factory RandomStringModel.fromJson(Map<String, dynamic> json) {
    return RandomStringModel(
      randomString: json['randomString'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'randomString': randomString,
    };
  }
}
