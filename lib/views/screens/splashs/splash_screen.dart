import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city_app/blocs/splashs/splash_bloc.dart';
import 'package:smart_city_app/blocs/splashs/splash_event.dart';
import 'package:smart_city_app/blocs/splashs/splash_state.dart';
import 'package:smart_city_app/utils/themes/app_color.dart';
import 'package:smart_city_app/utils/widgets/logo_rounded.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late SplashBloc splashBloc;

  @override
  void initState() {
    super.initState();
    splashBloc = SplashBloc();
    splashBloc.add(CheckTokenEvent());
  }

  @override
  void dispose() {
    splashBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => splashBloc,
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, splashState) {
          Navigator.pushNamed(context, splashState.route);
        },
        child: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return const Scaffold(
      backgroundColor: AppColor.dark,
      body: Center(
        child: LogoRounded(
          width: 200,
        ),
      ),
    );
  }
}
