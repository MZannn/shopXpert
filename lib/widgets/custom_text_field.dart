import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.isEmail = false,
    this.isObscure = false,
    this.suffix = const SizedBox(),
  });
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool isEmail;
  final bool isObscure;
  final Widget suffix;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextFormField(
      obscureText: isObscure,
      obscuringCharacter: "*",
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
        label: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        suffixIcon: suffix,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 16,
        ),
        hintText: hint,
        hintStyle: textTheme.bodyMedium!.copyWith(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            25,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            25,
          ),
          borderSide: BorderSide(
            color: Colors.orange[800]!,
          ),
        ),
      ),
    );
  }
}
