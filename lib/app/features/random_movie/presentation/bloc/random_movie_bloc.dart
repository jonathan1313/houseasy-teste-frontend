import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'random_movie_event.dart';
part 'random_movie_state.dart';

class RandomMovieBloc extends Bloc<RandomMovieEvent, RandomMovieState> {
  RandomMovieBloc() : super(RandomMovieInitial()) {
    on<RandomMovieEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
