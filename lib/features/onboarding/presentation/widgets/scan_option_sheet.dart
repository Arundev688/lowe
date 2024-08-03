import 'package:flutter/material.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/features/onboarding/presentation/provider/onboard_provider.dart';
import 'package:lowes/features/onboarding/presentation/widgets/bottom-sheet.dart';
import 'package:lowes/features/onboarding/presentation/widgets/elevation_container.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

scanOptionAlert({
  required BuildContext context,
  required OnboardProvider provider,
}) {
   showMaterialModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.6,
          widthFactor: 0.92,
          child: Container(
              padding: const EdgeInsets.only(right: 8),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      width: ScreenDimensions.screenWidth(context) * 0.12,
                      height: ScreenDimensions.screenHeight(context) * 0.08,
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
                    height: ScreenDimensions.screenHeight(context) * 0.38,
                    child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 0.8),
                        itemCount: provider.scanOptions.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () async {
                              await provider.scanBarcode(context, index,
                                  provider.scanOptions[index]['scan_option']!);
                            },
                            child: BottomModalSheet(
                              title: provider.scanOptions[index]['scan_option'] ??
                                  "",
                              image: provider.scanOptions[index]['image'] ?? "",
                            ),
                          );
                        }),
                  ),
                ],
              )),
        );
      }
  );
   /*   showModalBottomSheet(
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * (518 / 812),
      minHeight: MediaQuery.of(context).size.height * (518 / 812),
    ),
    enableDrag: true,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    useRootNavigator: true,
    isDismissible: true,
    context: context,
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.78,
        widthFactor: 0.92,
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
                    width: ScreenDimensions.screenWidth(context) * 0.12,
                    height: ScreenDimensions.screenHeight(context) * 0.08,
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
                  height: ScreenDimensions.screenHeight(context) * 0.38,
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 0.8),
                      itemCount: provider.scanOptions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () async {
                            await provider.scanBarcode(context, index,
                                provider.scanOptions[index]['scan_option']!);
                          },
                          child: BottomModalSheet(
                            title: provider.scanOptions[index]['scan_option'] ??
                                "",
                            image: provider.scanOptions[index]['image'] ?? "",
                          ),
                        );
                      }),
                ),
              ],
            )),
      );
    },
  );*/
}
