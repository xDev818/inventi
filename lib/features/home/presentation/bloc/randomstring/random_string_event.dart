import 'package:equatable/equatable.dart';

sealed class RandomStringEvent extends Equatable {
  const RandomStringEvent();

  @override
  List<Object> get props => [];
}

class FetchAllRandomString extends RandomStringEvent {
  const FetchAllRandomString();
}
