import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown(
      {super.key,
      this.labelText,
      this.width,
      required this.hint,
      required this.listOfItems,
      required this.onChanged,
      required this.value,
      required this.onRemove});

  List<String> listOfItems;
  Function onChanged;
  String? hint;
  String? labelText;
  String? value;
  double? width;
  void Function()? onRemove;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null)
            Text(labelText.toString(), style: AppTextStyle.content),
          if (labelText != null) SizedBox(height: 6),
          SizedBox(
              width: width ?? double.infinity,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: lightGray,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Text(
                      hint.toString(),
                      style: AppTextStyle.content,
                      overflow: TextOverflow.ellipsis,
                    ),
                    underline: Container(),
                    items: listOfItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    item,
                                    style: AppTextStyle.content,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                    value: value,
                    onChanged: (v) {
                      onChanged(v);
                    },
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
