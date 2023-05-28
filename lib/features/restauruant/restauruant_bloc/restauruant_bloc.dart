import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../model/restaurent.dart';
 import '../service/restauruant_service.dart';

part 'restauruant_event.dart';
part 'restauruant_state.dart';

class RestauruantBloc extends Bloc<RestaurentEvent, RestaurantsState> {
  final RestaurantsService restaurantsService;
   List<RestaurentDatum> _restaurentes = [];
  List<RestaurentDatum> get restaurentes => _restaurentes;

  RestauruantBloc(this.restaurantsService) : super(RestaurantsInitial()) {

    on<GetRestaurentList>((event, emit) async {

      try {
        emit(RestaurantsLoading());
        Restaurent  restaurent = await restaurantsService.getAllRestaurants();
        _restaurentes = restaurent.data;
        emit(RestaurantsLoaded(restaurentes :_restaurentes));
        if (!restaurent.status) {
          emit(RestaurantsError("something error"));
        }
      } on DioError {
        emit(RestaurantsError("Failed to fetch data. is your device online?"));
      }
    });

    on<FindRestaurantById>((event, emit) async {
      RestaurentDatum foundRestaurant =
      restaurentes.firstWhere((element) => element.id == event.id);
      emit(RestaurantById(restaurente:  foundRestaurant));

    });
  }
}
