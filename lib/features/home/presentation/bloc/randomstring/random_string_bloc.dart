import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventi/features/home/domain/usecases/randomstring_usecase.dart';
import 'package:inventi/features/home/presentation/bloc/randomstring/random_string_event.dart';
import 'package:inventi/features/home/presentation/bloc/randomstring/random_string_state.dart';

class RandomStringBloc extends Bloc<RandomStringEvent, RandomStringState> {
  final RandomStringUsecase getRandomStringUsecase;

  RandomStringBloc({required this.getRandomStringUsecase})
      : super(RandomStringInitial()) {
    on<FetchAllRandomString>(_onFetchRandomString);
  }

  Future<void> _onFetchRandomString(
      FetchAllRandomString event, Emitter<RandomStringState> emit) async {
    try {
      emit(RandomStringLoading()); // Emit loading state
      final result = await getRandomStringUsecase(UserParams(token: ''));

      // Handle the result from the use case
      result.fold(
        (failure) {
          // Handle failure and emit error state
          emit(const RandomStringError(
              message: 'Failed to fetch random string'));
        },
        (randomstring) {
          // Handle success and emit loaded state with data
          emit(RandomStringLoaded(allRandomString: randomstring));
        },
      );
    } catch (e) {
      emit(RandomStringError(
          message: 'Failed to fetch random string: $e')); // Emit error state
    }
  }
}
