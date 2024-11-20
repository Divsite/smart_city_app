import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:smart_city_app/blocs/auths/auth_bloc.dart';
import 'package:smart_city_app/blocs/auths/auth_event.dart';
import 'package:smart_city_app/blocs/auths/auth_state.dart';
import 'package:smart_city_app/utils/routes/route_name.dart';
import 'package:smart_city_app/utils/themes/app_color.dart';
import 'package:smart_city_app/utils/widgets/logo_rounded.dart';
import 'package:smart_city_app/views/widgets/logins/password_form_field.dart';
import 'package:smart_city_app/views/widgets/logins/username_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }   

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider<AuthBloc>(
      create: (_) => Get.find<AuthBloc>(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLogin) {
            Navigator.pushNamedAndRemoveUntil(context, homeScreen, (route) => false);
          } else if (state is AuthLoginError) {
            setState(() {
              isLoading = false;
            });
          }
        },
        child: LoadingOverlay(
          isLoading: isLoading,
          child: Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.20,
                  ),
                  const LogoRounded(
                    width: 150
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  LoginForm(
                    usernameController: usernameController,
                    passwordController: passwordController,
                    onLoginPressed: () {
                      _login(context);
                    },
                  ),
                ],
              )
            )
          )
        ),
      ),
    );
  }
  
  /// Handles the login process by dispatching a login event and setting loading state
  void _login(BuildContext context) {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      setState(() => isLoading = false);
    } else {
      BlocProvider.of<AuthBloc>(context).add(
        LoginEvent(
          username: usernameController.text,
          password: passwordController.text,
        ),
      );
      setState(() => isLoading = true);
    }
  }
}

/// LoginForm is a widget containing the login form fields and the login button
class LoginForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final VoidCallback onLoginPressed;

  const LoginForm({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.onLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UsernameFormField(
          hintText: 'Username',
          controller: usernameController,
        ),
        const SizedBox(height: 10),
        PasswordFormField(
          hintText: 'Password',
          controller: passwordController
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 45,
          child: LoginButton(onPressed: onLoginPressed),
        ),
      ],
    );
  }
}

/// LoginButton is a widget that triggers the login action when pressed
class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginButton({
    super.key, 
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primary,
      ),
      onPressed: onPressed,
      child: const Text('Signin'),
    );
  }
}