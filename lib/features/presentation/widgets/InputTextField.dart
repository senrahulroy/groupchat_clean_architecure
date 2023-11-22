import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../configuration/theme/app_theme.dart';

class CustomInputTextField extends StatelessWidget {
  final TextEditingController? controller;

  final FocusNode? focusNode;

  final FormFieldValidator? validator;

  final ValueChanged<String>? onChanged;

  final ValueChanged<String>? onSubmitted;


  final bool? isObscureText;

  final String labelText;

  final Color? prefixIconColor;

  final Widget? prefix;

  final Widget? suffix;

  final Color? suffixIconColor;

  final TextInputType? textInputType;

  final bool? readOnly;

  final bool? autoFocus;

  final List<TextInputFormatter>? inputFormatters;

  const CustomInputTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.validator,
    this.isObscureText,
    required this.labelText,
    this.prefixIconColor = AppColors.greenColor,
    this.prefix,
    this.suffix,
    this.suffixIconColor = AppColors.greenColor,
    this.textInputType,
    this.readOnly,
    this.inputFormatters, this.onChanged, this.onSubmitted, this.autoFocus = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.greyColors.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        autofocus: autoFocus ?? false,
        validator: validator,
        obscureText: isObscureText ?? false,
        inputFormatters: inputFormatters,
        keyboardType: textInputType,
        readOnly: readOnly ?? false,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,

        decoration: InputDecoration(
          hintText: labelText,
          prefixIcon: prefix,
          prefixIconColor: prefixIconColor,
          suffixIcon: suffix,
          suffixIconColor: suffixIconColor,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.greenColor)),
        ),
      ),
    );
    ;
  }
}
