import 'dart:io';

import '../../../../core/constants/enums/network_enums.dart';
import '../../auth/bloc/model/auth_model.dart';
 import 'i_restauruant_service.dart';

class RestaurantsService extends IRestaurantsService {
  RestaurantsService(super.dioManager);

  @override
  Future<dynamic> getAllRestaurants() async {
    var response = await dioManager.dio.get(
      NetworkEnums.allRestaurent.path,
    );

    if (response.statusCode == HttpStatus.ok) {
      return  [];
    } else {
      return response.data;
    }
  }


}
