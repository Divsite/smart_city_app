import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_city_app/blocs/splashs/splash_event.dart';
import 'package:smart_city_app/blocs/splashs/splash_state.dart';
import 'package:smart_city_app/datas/models/shared_preferences/shared_pref.dart';
import 'package:smart_city_app/utils/routes/route_name.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<CheckTokenEvent>((event, emit) async {
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      final SharedPref sharedPref = SharedPref(sharedPreferences);
      final String? token = await sharedPref.getToken();

      if (token != null) {
        emit(state.copyWith(route: homeScreen));
      } else {
        emit(state.copyWith(isLoading: false));
      }
    });
  }
}
