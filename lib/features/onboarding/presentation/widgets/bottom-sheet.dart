import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              width: ScreenDimensions.screenWidth(context) * 0.15,
              height: ScreenDimensions.screenHeight(context) * 0.1,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(blurRadius: 1, color: lightGray, spreadRadius: 1)
                ],
              ),
              child: SvgPicture.asset(image, fit: BoxFit.contain)),
          SizedBox(
           width: ScreenDimensions.screenWidth(context) * 0.15,
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
               children: [
                 Text(
                   title,
                   textAlign: TextAlign.center,
                   style:
                   AppTextStyle.textPrime.copyWith(fontSize: 12, color: black),
                   maxLines: 2,
                   overflow: TextOverflow.ellipsis,
                 ),
               ],
             ),
          )
        ],
      );
  }
}
