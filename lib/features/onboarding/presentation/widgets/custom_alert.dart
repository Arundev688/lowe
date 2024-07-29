import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowes/core/commonwidgets/button.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';

showAlert(
    {required BuildContext context,
    required String title,
    required VoidCallback? onYes,
    String? image,
    required VoidCallback? onNo}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Container(
              padding: const EdgeInsets.all(8), // Border width
              decoration:
              const BoxDecoration(color: primaryLight, shape: BoxShape.circle),
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(16), // Image radius
                  child: SvgPicture.asset(
                    image!,
                    width: ScreenDimensions.screenWidth(context) * 0.04,
                    height: ScreenDimensions.screenHeight(context) * 0.04,
                  ),
                ),
              ),
            ),
          ),
          content: Text(title, style: AppTextStyle.title),
          actions: [
            Row(
              children: [
                Expanded(
                    child: CustomButton(
                        text: 'Yes',
                        buttonColor: primary,
                        height: ScreenDimensions.screenHeight(context) * 0.055,
                        textStyle: const TextStyle(color: white, fontSize: 13),
                        onPressed: onYes)),
                SizedBox(width: ScreenDimensions.screenWidth(context) * 0.01),
                Expanded(
                    child: CustomButton(
                        text: 'No',
                        buttonColor: lightText,
                        height: ScreenDimensions.screenHeight(context) * 0.055,
                        textStyle: const TextStyle(color: black, fontSize: 13),
                        onPressed: onNo)),
              ],
            )
          ],
        );
      });
}
