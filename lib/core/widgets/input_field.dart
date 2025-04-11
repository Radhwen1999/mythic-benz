import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mythic_benz/core/res/style/colours.dart';


class InputField extends StatelessWidget {
  const InputField({
    required this.controller,
    this.obscureText = false,
    this.defaultValidation = true,
    this.enabled = true,
    this.readOnly = false,
    this.expandable = false,
    super.key,
    this.suffixIcon,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.prefix,
    this.contentPadding,
    this.prefixIcon,
    this.focusNode,
    this.onTap,
    this.suffixIconConstraints,
    this.onTapOutside,
    this.onSubmitted,
  });

  final Widget? suffixIcon;
  final String? hintText;
  final String? Function(String? value)? validator;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool defaultValidation;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefix;
  final bool enabled;
  final bool readOnly;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final bool expandable;
  final BoxConstraints? suffixIconConstraints;
  final ValueChanged<PointerDownEvent>? onTapOutside;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      focusNode: focusNode,
      obscureText: obscureText,
      enabled: enabled,
      readOnly: readOnly,
      maxLines: expandable ? 5 : 1,
      minLines: expandable ? 1 : null,
      onTap: onTap,
      onTapOutside: onTapOutside,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
        suffixIconConstraints: suffixIconConstraints,
        prefix: prefix,
        prefixIcon: Container(
          margin: const EdgeInsets.only(left: 8, right: 9),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colours.lightGreyTintColor,
          ),
          child: prefixIcon,
        ),
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(horizontal: 16),
        filled: true,
      ),
      inputFormatters: inputFormatters,
      validator:
          defaultValidation
              ? (value) {
                if (value == null || value.isEmpty) return 'Required Field';
                return validator?.call(value);
              }
              : validator,
    );
  }
}
