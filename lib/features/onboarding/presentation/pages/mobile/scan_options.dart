import 'package:flutter/material.dart';
import 'package:lowes/features/onboarding/presentation/provider/onboard_provider.dart';
import 'package:lowes/features/onboarding/presentation/widgets/onboard_options_item.dart';
import 'package:provider/provider.dart';

class ScanOptions extends StatefulWidget {
  const ScanOptions({super.key});

  @override
  State<ScanOptions> createState() => _ScanOptionsState();
}

class _ScanOptionsState extends State<ScanOptions> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardProvider>(builder: (i, provider, p) {
      return Scaffold(
          body: GridView.builder(
            physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(12.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0),
              itemCount: provider.scanOptions.length,
              itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () async {
                      await provider.scanBarcode(context);
                    },
                    child: OnboardOptionsItem(
                      title: provider.scanOptions[index]['scan_option'] ?? "" ,
                      image: provider.scanOptions[index]['image'] ?? "",
                    ),
                  );
              }));
    });
  }
}
