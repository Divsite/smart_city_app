import 'package:flutter/material.dart';
import 'package:smart_city_app/utils/themes/app_color.dart';
import 'package:smart_city_app/views/widgets/logins/form_decoration.dart';

class PasswordFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;

  const PasswordFormField({
    super.key,
    this.controller,
    this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      controller: controller,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: FormDecoration(
        prefixIcon: const Icon(
          Icons.lock_outline_rounded,
          color: AppColor.gray,
        ),
        hintText: hintText ?? '',
      ),
    );
  }
}
