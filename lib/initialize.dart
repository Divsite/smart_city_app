import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_city_app/blocs/auths/auth_bloc.dart';
import 'package:smart_city_app/datas/clients/client_dio.dart';
import 'package:smart_city_app/datas/models/shared_preferences/shared_pref.dart';
import 'package:smart_city_app/datas/repositories/auth_repository.dart';


Future<void> initialize() async {
  // External
  final pref = await SharedPreferences.getInstance();
  Get.put(pref);

  // ClientDio
  Get.put(ClientDio(sharedPreferences: Get.find<SharedPreferences>()));

  // Repository
  Get.put(AuthRepository(clientDio: Get.find<ClientDio>()));

  // Bloc
  Get.put(AuthBloc(
    authRepository: Get.find<AuthRepository>(),
    sharedPref: SharedPref(Get.find<SharedPreferences>()),
  ));
}