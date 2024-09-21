import 'package:equatable/equatable.dart';
import 'package:inventi/features/home/domain/entities/raandomstring_entity.dart';

sealed class RandomStringState extends Equatable {
  const RandomStringState();

  @override
  List<Object> get props => [];
}

final class RandomStringInitial extends RandomStringState {}

final class RandomStringLoading extends RandomStringState {}

final class RandomStringLoaded extends RandomStringState {
  final List<RandomStringEntity> allRandomString;

  const RandomStringLoaded({required this.allRandomString});
}

final class RandomStringError extends RandomStringState {
  final String message;

  const RandomStringError({required this.message});
}
