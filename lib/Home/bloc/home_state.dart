part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeloadedState extends HomeState{
  final Country1;
  final Country2;
  final Country3;

  HomeloadedState(this.Country1, this.Country2, this.Country3);
  @override
  List<Object> get props => [Country1,Country2,Country3];
}