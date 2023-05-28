part of 'restauruant_bloc.dart';

abstract class RestaurentEvent extends Equatable {
  const RestaurentEvent();

  @override
  List<Object> get props => [];
}

class GetRestaurentList extends RestaurentEvent {}
class FindRestaurantById  extends RestaurentEvent {
  final int id ;

  FindRestaurantById({ required this.id});

}
