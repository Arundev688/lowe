import 'package:flutter/material.dart';
import 'package:lowes/core/responsive/screensize.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;

  const ResponsiveLayout(
      {super.key, required this.mobileBody, required this.desktopBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < mobileWidth;
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
              textScaler: isMobile
                  ? const TextScaler.linear(1)
                  : const TextScaler.linear(1.2),
             /* size: Size(MediaQuery.sizeOf(context).width * double.infinity,
                  MediaQuery.sizeOf(context).height * double.infinity)*/),
          child: isMobile ? mobileBody : desktopBody,
        );
      },
    );
  }
}
