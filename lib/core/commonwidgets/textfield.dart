import 'package:flutter/material.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';


class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer(
      {this.validation,
        required this.textInputType,
        required this.textEditingController,
        this.suffixWidget,
        this.prefixWidget,
        this.isObsecure = false,
        this.isDisabled = false,
        this.hint,
        this.errorText,
        this.onSuffixTap,
        this.onPrefixTap,
        this.action= TextInputAction.done,
        this.maxLength,
        this.enabled = true,
        this.isDense = false,
        this.focusNode,
        this.maxLines=1,
        required this.height,
        this.onChanged,
        super.key});

  final TextEditingController textEditingController;
  final String? Function(String?)? validation;
  final TextInputType textInputType;
  final GestureTapCallback? onSuffixTap;
  final GestureTapCallback? onPrefixTap;

  final bool isObsecure;
  final bool? isDisabled;
  final bool? enabled;
  final String? hint;
  final bool? isDense;
  final String? errorText;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final int? maxLength;
  final int? maxLines;
  final FocusNode? focusNode;
  final TextInputAction? action;
  final double? height;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: TextFormField(
        enabled: enabled,
        maxLength: maxLength,
        maxLines: maxLines,
        textInputAction: action,
        cursorColor: primary,
        controller: textEditingController,
        focusNode: focusNode,
        textAlign: TextAlign.start,
        onChanged: onChanged,
        keyboardType: textInputType,
        style: AppTextStyle.textField,
        textAlignVertical: TextAlignVertical.center,
        obscureText: isObsecure,
        validator: validation,
        decoration: InputDecoration(
          errorText: errorText,
          isDense: isDense,
          contentPadding:EdgeInsets.symmetric(
            vertical: ScreenDimensions.screenHeight(context)*0.01,
            horizontal: ScreenDimensions.screenWidth(context)*0.01),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: lightText),
          ),
          labelText: hint,
          labelStyle: AppTextStyle.textHint,
          errorStyle: AppTextStyle.textField.copyWith(color: error),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: error),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: primary),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: error),
          ),
          suffixIcon: suffixWidget != null
              ? GestureDetector(
            onTap: onSuffixTap,
            child: suffixWidget,
          )
              : const SizedBox(),
/*          prefixIcon:prefixWidget != null
              ? GestureDetector(
            onTap: onPrefixTap,
            child: prefixWidget,
          )
              : const SizedBox(),*/
          hintStyle: AppTextStyle.textField,
        ),
      ),
    );
  }
}