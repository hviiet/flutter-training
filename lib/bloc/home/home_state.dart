import '../../models/home_data.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeData homeData;

  HomeLoaded(this.homeData);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}