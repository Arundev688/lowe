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
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Container(
            width: ScreenDimensions.screenWidth(context) * 0.6,
            height: ScreenDimensions.screenWidth(context) * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8), // Border width
                      decoration: const BoxDecoration(
                          color: primaryLight, shape: BoxShape.circle),
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
                    Text(title, style: AppTextStyle.title),
                    SizedBox(
                        height: ScreenDimensions.screenHeight(context) * 0.04),
                    Row(
                      children: [
                        Expanded(
                            child: CustomButton(
                                text: 'Yes',
                                buttonColor: primary,
                                height:
                                    ScreenDimensions.screenHeight(context) * 0.07,
                                textStyle:
                                    const TextStyle(color: white, fontSize: 14),
                                onPressed: onYes)),
                        SizedBox(
                            width: ScreenDimensions.screenWidth(context) * 0.02),
                        Expanded(
                            child: CustomButton(
                                text: 'No',
                                buttonColor: lightText,
                                height:
                                    ScreenDimensions.screenHeight(context) * 0.07,
                                textStyle:
                                    const TextStyle(color: black, fontSize: 14),
                                onPressed: onNo)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
      });
}
