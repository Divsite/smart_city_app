import 'package:flutter/material.dart';
import 'package:smart_city_app/utils/themes/app_color.dart';
import 'package:smart_city_app/views/widgets/logins/form_decoration.dart';

class UsernameFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;

  const UsernameFormField({
    super.key,
    this.controller,
    this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColor.primary,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: FormDecoration(
        prefixIcon: const Icon(
          Icons.person,
          color: AppColor.gray,
        ),
        hintText: hintText ?? '',
      ),
    );
  }
}
