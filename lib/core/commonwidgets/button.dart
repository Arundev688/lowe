import 'package:flutter/material.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';


class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
        this.buttonColor = primary,
        this.borderRadius = 6,
        this.width,
        this.height,
        this.splashColor = secondaryLight,
        required this.text,
        this.onPressed,
        this.suffixWidget,
        this.textColor=Colors.black,
        this.textStyle});
  final Color buttonColor;
  final double borderRadius;

  final double? width;
  final double? height;
  final Color splashColor;
  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final Widget? suffixWidget;
  final Color? textColor;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
                foregroundColor: splashColor, animationDuration: const Duration(milliseconds: 300),
                textStyle: textStyle ??
                    AppTextStyle.button,
                backgroundColor: buttonColor,
                fixedSize: Size(
                  width ?? double.infinity,
                  height ?? ScreenDimensions.screenHeight(context) * 0.07,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text.toUpperCase(),
                  style: textStyle ??
                      AppTextStyle.button,
                ),
                suffixWidget ?? const SizedBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
