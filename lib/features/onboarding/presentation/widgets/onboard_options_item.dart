import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';
import 'package:lowes/features/onboarding/presentation/widgets/elevation_container.dart';

class OnboardOptionsItem extends StatelessWidget {
  const OnboardOptionsItem(
      {super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return customContainer(
        containerColor: lightGray,
        radius: 10.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              fit: BoxFit.contain,
              width: ScreenDimensions.screenWidth(context) * 0.15,
              height: ScreenDimensions.screenHeight(context) * 0.1,
            ),
            Container(
                alignment: Alignment.center,
                width: ScreenDimensions.screenWidth(context) * 0.15,
                child: Text(
                  title,
                  style: AppTextStyle.content,
                  textAlign: TextAlign.center,
                ))
          ],
        ));
  }
}
