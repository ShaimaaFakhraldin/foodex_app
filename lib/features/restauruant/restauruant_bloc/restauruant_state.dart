part of 'restauruant_bloc.dart';

abstract class RestaurantsState extends Equatable {
  const RestaurantsState();

  @override
  List<Object?> get props => [];
}

class RestaurantsInitial extends RestaurantsState {}

class RestaurantsLoading extends RestaurantsState {}

class RestaurantsLoaded extends RestaurantsState {
  final List<RestaurentDatum> restaurentes;
  const RestaurantsLoaded( {required this.restaurentes});
}

class RestaurantById extends RestaurantsState {
  final  RestaurentDatum restaurente;
  const RestaurantById( {required this.restaurente});
}
class RestaurantsError extends RestaurantsState {
  final String? message;
  const RestaurantsError(this.message);
}
