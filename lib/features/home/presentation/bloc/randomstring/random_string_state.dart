// Date : Sept 21, 2024
// Author : RLP
// Purpose : States represent the different conditions or views of the application at any given
//            time. The BLoC emits new states based on the processing of events.
//            States can reflect loading conditions, success or failure outcomes, or specific data
//            that the UI needs to display.
//
//            extends a base class, providing a clear structure for different application states.

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
