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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenDimensions.screenHeight(context) * 0.08,
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
        keyboardType: textInputType,
        style: AppTextStyle.textField,
        textAlignVertical: TextAlignVertical.center,
        obscureText: isObsecure,
        validator: validation,
        decoration: InputDecoration(
          errorText: errorText,
          isDense: isDense,
          contentPadding:EdgeInsets.symmetric(
            horizontal: 0.0,
              vertical: ScreenDimensions.screenHeight(context) * 0.01),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.2, color: lightText),
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              )),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.2 , color: lightText),
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              )),
          hintText: hint,
          errorStyle: AppTextStyle.textField.copyWith(color: error),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1.0, color: error),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1.0, color: lightText),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1.3, color: error),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          suffixIcon: suffixWidget != null
              ? GestureDetector(
            onTap: onSuffixTap,
            child: suffixWidget,
          )
              : const SizedBox(),
          prefixIcon:prefixWidget != null
              ? GestureDetector(
            onTap: onPrefixTap,
            child: prefixWidget,
          )
              : const SizedBox(),
          hintStyle: AppTextStyle.textField,
        ),
      ),
    );
  }
}