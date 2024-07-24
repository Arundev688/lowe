

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lowes/core/commonwidgets/textfield.dart';
import 'package:lowes/core/theme/color.dart';

class AssetListWeb extends StatefulWidget {
  const AssetListWeb({super.key});

  @override
  State<AssetListWeb> createState() => _AssetListWebState();
}

class _AssetListWebState extends State<AssetListWeb> {
  Timer? _debounce;
  late TextEditingController searchController;
  late TextEditingController pageController;

  _onSearchChanged(String query) {
    if (query.isEmpty) return;
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {

    });
  }


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }

  Widget searchTextWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 8,
            child: TextFieldContainer(
              textEditingController: searchController,
              hint: "Search by Agent name",
              textInputType: TextInputType.emailAddress,
              /*onChanged: (value) {
                _onSearchChanged(value);
              },*/
              prefixWidget: const Icon(
                Icons.search,
                color: black,
              ),
              isObsecure: false,
              suffixWidget: const SizedBox(),
            )),
        Expanded(
            flex: 1,
            child:InkWell(
              onTap: (){

              },
              child: const Row(
                children: [
                  Icon(Icons.cancel_outlined),
                  Text("CANCEL")
                ],
              ),
            )),
      ],

    );
  }
}
