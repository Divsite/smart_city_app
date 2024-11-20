import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_city_app/datas/clients/client_dio.dart';
import 'package:smart_city_app/datas/models/shared_preferences/shared_pref.dart';
import 'package:smart_city_app/initialize.dart';
import 'package:smart_city_app/providers/user_provider.dart';
import 'package:smart_city_app/utils/extensions/globals.dart';
import 'package:smart_city_app/utils/routes/route.dart';
import 'package:smart_city_app/utils/routes/route_name.dart';
import 'package:smart_city_app/utils/themes/app_color.dart';

void main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    log("FlutterError: ${details.exceptionAsString()}");
  };

  WidgetsFlutterBinding.ensureInitialized();
  await initialize();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
    State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ClientDio dioClient;
  late SharedPref sharedPref;

  @override
  void initState() {
    initialData();
    super.initState();
  }

  void initialData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    dioClient = ClientDio (sharedPreferences: preferences);
    sharedPref = SharedPref(preferences);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        navigatorKey: globalAlice.getNavigatorKey(), // call alice to open inspection
        title: 'Nexcity',
        builder: (context, child) {
          MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true), 
            child: child!
          );
          return ScrollConfiguration(
            behavior: RemoveScrollGlowBehavior(),
            child: child
          );
        },
        theme: ThemeData(
          fontFamily: 'Heebo',
          primarySwatch: AppColor.primary,
          appBarTheme: const AppBarTheme(
            color: AppColor.primary,
            iconTheme: IconThemeData(
              color: AppColor.white,
            ),
          ),
          scaffoldBackgroundColor: AppColor.white,
          dialogBackgroundColor: AppColor.white,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(),
            bodyMedium: TextStyle(),
            bodySmall: TextStyle(),
          ).apply(
            bodyColor: Colors.white,
          ),
          primaryIconTheme: const IconThemeData(
            color: AppColor.white,
          ),
          buttonTheme: const ButtonThemeData(
            buttonColor: AppColor.blue,
          ),
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            }
          )
        ),
        initialRoute: initialScreen,
        onGenerateRoute: Routes().onGenerateRoute,
      ),
    );
  }
}

class RemoveScrollGlowBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
    BuildContext context, Widget child, AxisDirection axisDirection
  ) {
    return child;
  }
}