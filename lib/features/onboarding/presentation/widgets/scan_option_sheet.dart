import 'package:flutter/material.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/features/onboarding/presentation/provider/onboard_provider.dart';
import 'package:lowes/features/onboarding/presentation/widgets/bottom-sheet.dart';
import 'package:lowes/features/onboarding/presentation/widgets/elevation_container.dart';

scanOptionAlert({
  required BuildContext context,
  required OnboardProvider provider,
}) {
  showModalBottomSheet(
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * (518 / 812),
      minHeight: MediaQuery.of(context).size.height * (518 / 812),
    ),
    enableDrag: true,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    isDismissible: true,
    context: context,
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.7,
        widthFactor: 0.9,
        child: Container(
            padding: const EdgeInsets.only(right: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    width: ScreenDimensions.screenWidth(context) * 0.1,
                    height: ScreenDimensions.screenHeight(context) * 0.08,
                    margin: const EdgeInsets.all(2),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: lightGray,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 1, color: lightGray, spreadRadius: 1)
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                    )),
                SizedBox(
                  height: ScreenDimensions.screenHeight(context) * 0.3,
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.5),
                      itemCount: provider.scanOptions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () async {
                            await provider.scanBarcode(context);
                          },
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: BottomModalSheet(
                              title: provider.scanOptions[index]
                                      ['scan_option'] ??
                                  "",
                              image: provider.scanOptions[index]['image'] ?? "",
                            ),
                          ),
                        );
                      }),
                ),
              ],
            )),
      );
    },
  );
}
