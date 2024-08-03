import 'package:flutter/material.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/features/onboarding/presentation/widgets/entity_list_items.dart';

class EntityList2 extends StatefulWidget {
  const EntityList2({super.key});

  @override
  State<EntityList2> createState() => _EntityList2State();
}

class _EntityList2State extends State<EntityList2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Mutualfundlist(
                    ),
                  );
                }),
          )
        ],
      );
  }
}
