 import '../../../../core/init/network/dio_manager.dart';
import '../../auth/bloc/model/auth_model.dart';

abstract class IRestaurantsService {
  final DioManager dioManager;

  IRestaurantsService(this.dioManager);

  Future<dynamic> getAllRestaurants();

}
