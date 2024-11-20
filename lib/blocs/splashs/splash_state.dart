import 'package:equatable/equatable.dart';
import 'package:smart_city_app/utils/routes/route_name.dart';

class SplashState extends Equatable {
  final String route;
  final String? version;
  final bool isLoading;

  const SplashState({
    this.route = login,
    this.version,
    this.isLoading = false,
  });

  SplashState copyWith({
    String? route,
    String? version,
    bool? isLoading,
  }) {
    return SplashState(
      route: route ?? this.route,
      version: version ?? this.version,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [route, version, isLoading];
}
