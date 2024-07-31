import 'package:flutter/material.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';

class BottomModalSheet extends StatelessWidget {
  final String image;
  final String title;

  const BottomModalSheet({required this.image, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: ScreenDimensions.screenWidth(context) * 0.2,
              height: ScreenDimensions.screenHeight(context) * 0.1,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(blurRadius: 1, color: lightGray, spreadRadius: 1)
                ],
              ),
              child: Image.asset(image, fit: BoxFit.contain)),
          const SizedBox(height: 2),
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
             children: [
               Text(
                 title,
                 style:
                 AppTextStyle.textPrime.copyWith(fontSize: 12, color: textColor),
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,
               ),
             ],
           )
        ],
      );
  }
}
