part of 'random_movie_bloc.dart';

abstract class RandomMovieState extends Equatable {
  const RandomMovieState();  

  @override
  List<Object> get props => [];
}
class RandomMovieInitial extends RandomMovieState {}
