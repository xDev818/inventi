// Date : Sept 21, 2024
// Author : RLP
// Purpose : Events represent user interactions or other triggers that require the BLoC to perform
//            a specific action. They are used to notify the BLoC about changes that should lead
//            to new states.

import 'package:equatable/equatable.dart';

sealed class RandomStringEvent extends Equatable {
  const RandomStringEvent();

  @override
  List<Object> get props => [];
}

class FetchAllRandomString extends RandomStringEvent {
  const FetchAllRandomString();
}
