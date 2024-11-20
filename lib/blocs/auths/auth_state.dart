import 'package:equatable/equatable.dart';
import 'package:smart_city_app/datas/models/responses/profile_response.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLogin extends AuthState {
  final String message;

  const AuthLogin({
    required this.message
  });

  @override
  List<Object> get props => [message];
}

class AuthLoginError extends AuthState {
  final String message;

  const AuthLoginError({
    required this.message
  });

  @override
  List<Object> get props => [message];
}

class AuthLogout extends AuthState {
  final String message;

  const AuthLogout({
    required this.message
  });

  @override
  List<Object> get props => [message];
}

class AuthLogoutError extends AuthState {
  final String message;

  const AuthLogoutError({
    required this.message
  });

  @override
  List<Object> get props => [message];
}

  class AuthProfile extends AuthState {
    final ProfileResponse profileResponse;

    const AuthProfile({
      required this.profileResponse
    });

    @override
    List<Object> get props => [profileResponse];
  }

class AuthProfileError extends AuthState {
  final String message;

  const AuthProfileError({
    required this.message
  });

  @override
  List<Object> get props => [message];
}

