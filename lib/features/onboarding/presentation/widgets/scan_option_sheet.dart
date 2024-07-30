import 'package:flutter/material.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/features/onboarding/presentation/widgets/bottom-sheet.dart';
import 'package:lowes/features/onboarding/presentation/widgets/elevation_container.dart';

scanOptionAlert({
  required BuildContext context,
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
          heightFactor: 0.8,
          widthFactor: 0.8,
          child: Container(
              padding: const EdgeInsets.only(bottom: 100, left: 10, right: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: BottomModalSheet()));
    },
  );
}
