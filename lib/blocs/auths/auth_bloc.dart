import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city_app/blocs/auths/auth_event.dart';
import 'package:smart_city_app/blocs/auths/auth_state.dart';
import 'package:smart_city_app/datas/models/responses/api_response.dart';
import 'package:smart_city_app/datas/models/responses/profile_response.dart';
import 'package:smart_city_app/datas/models/shared_preferences/shared_pref.dart';
import 'package:smart_city_app/datas/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final SharedPref sharedPref;

  AuthBloc({required this.authRepository, required this.sharedPref}) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      final ApiResponse apiResponse = await authRepository.login(
        username: event.username,
        password: event.password,
      );

      if (apiResponse.response != null) {
        sharedPref.setToken(apiResponse.response!.data['access_token']);
        emit(AuthLogin(message: apiResponse.response!.data['message']));
      } else {
        emit(AuthLoginError(message: apiResponse.error.toString()));
      }
    });

    on<LogoutEvent>((event, emit) async {
      final ApiResponse apiResponse = await authRepository.logout();

      if (apiResponse.response != null) {
        sharedPref.clear();
        emit(AuthLogout(message: apiResponse.response!.data['message']));
      } else {
        emit(AuthLogoutError(message: apiResponse.error.toString()));
      }
    });

    on<GetProfileEvent>((event, emit) async {
      final ApiResponse apiResponse = await authRepository.getProfile();

      if (apiResponse.response != null) {
        emit(AuthProfile(profileResponse: ProfileResponse.fromJson(apiResponse.response!.data['results'])));
      } else {
        emit(AuthProfileError(message: apiResponse.error.toString()));
      }
    });
  }
}
