

import 'package:flutter/material.dart';
import 'package:lowes/core/theme/color.dart';

customContainer({
  double? height,
  double? width,
  Color? containerColor,
  double? radius,
  Widget? child,
  void Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 8.0),
          color: containerColor ?? white,
          border: Border.all(color: secondaryGray,width: 1),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 2,
              spreadRadius: 1,
              color: Colors.black12.withOpacity(0.1),
            ),
          ]),
      child: child,
    ),
  );
}