import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lowes/core/commonwidgets/button.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';
import 'package:lowes/features/onboarding/presentation/provider/onboard_provider.dart';
import 'package:lowes/features/onboarding/presentation/widgets/custom_dropdown.dart';
import 'package:lowes/features/onboarding/presentation/widgets/secondary_textfield.dart';
import 'package:provider/provider.dart';

class OnboardGateway extends StatefulWidget {
  const OnboardGateway({super.key, required this.barcode});

  final String barcode;

  @override
  State<OnboardGateway> createState() => _OnboardGatewayState();
}

class _OnboardGatewayState extends State<OnboardGateway> {
  final TextEditingController _barcodeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();


  @override
  void initState() {
    _barcodeController.text = widget.barcode;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardProvider>(builder: (ctx, provider, child) {
      return Scaffold(
        backgroundColor: primaryLight,
        appBar: AppBar(
          backgroundColor: primary,
          title: Text("Onboard Gateway",
              style: AppTextStyle.title.copyWith(color: white)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: white),
            onPressed: () {
              context.go('/dashboardMobile');
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: Column(
            children: [
              Text('Barcode', style: AppTextStyle.content,),
              SizedBox(height: 5),
              SecondaryEdittext(
                controller: _barcodeController, hintText: "Enter Barcode",),
              SizedBox(height: 15),
              Text('Name', style: AppTextStyle.content,),
              SizedBox(height: 5),
              SecondaryEdittext(
                controller: _nameController, hintText: "Enter Name",),
              SizedBox(height: 15),
              Text('Type', style: AppTextStyle.content,),
              SizedBox(height: 5),
              CustomDropDown(
                hint: '',
                listOfItems: provider.gatewayTypes,
                onChanged: (val) {

                },
                value: '',
                onRemove: () {},),
              SizedBox(height: 15),

              Text('Category', style: AppTextStyle.content,),
              SizedBox(height: 5),
              CustomDropDown(
                hint: '',
                listOfItems: provider.gatewayCategory,
                onChanged: (val) {

                },
                value: '',
                onRemove: () {},),
              SizedBox(height: 15),
              Text('Location', style: AppTextStyle.content),
              SizedBox(height: 5),
              SecondaryEdittext(
                controller: _locationController, hintText: "Enter Location",),
              const SizedBox(height: 25),
              CustomButton(
                text: "Submit",
                buttonColor: primary,
                height: ScreenDimensions.screenHeight(context) * 0.05,
                onPressed:  () async {

                }
              ),
            ],
          ),
        ),
      );
    }
    );
  }
}
