import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lowes/core/commonwidgets/button.dart';
import 'package:lowes/core/commonwidgets/textfield.dart';
import 'package:lowes/core/constants/constants.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';

class ResetPasswordWeb extends StatefulWidget {
  const ResetPasswordWeb({super.key});

  @override
  State<ResetPasswordWeb> createState() => _ResetPasswordWebState();
}

class _ResetPasswordWebState extends State<ResetPasswordWeb> {
  final _passwordController = TextEditingController();
  var obSecurePassword = true;
  final _confirmPassword = TextEditingController();
  var obSecureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                color: primary,
              )),
          Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenDimensions.screenWidth(context) * 0.06),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Constants.resetTitle, style: AppTextStyle.title),
                    SizedBox(
                        height: ScreenDimensions.screenHeight(context) * 0.008),
                    const Divider(
                      thickness: 0.5,
                      color: lightText,
                      indent: 5,
                      endIndent: 5,
                    ),
                    SizedBox(
                        height: ScreenDimensions.screenHeight(context) * 0.03),
                    Text(Constants.password, style: AppTextStyle.textPrime),
                    SizedBox(
                        height: ScreenDimensions.screenHeight(context) * 0.012),
                    TextFieldContainer(
                      maxLines: 1,
                      action: TextInputAction.done,
                      isObsecure: obSecurePassword,
                      onSuffixTap: () {
                        setState(() {
                          obSecurePassword = !obSecurePassword;
                        });
                      },
                      suffixWidget: Icon(
                        obSecurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: textColor,
                        size: 25,
                      ),
                      textEditingController: _passwordController,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                        height: ScreenDimensions.screenHeight(context) * 0.03),
                    Text(Constants.confirmPassword, style: AppTextStyle.textPrime),
                    SizedBox(
                        height: ScreenDimensions.screenHeight(context) * 0.012),
                    TextFieldContainer(
                      maxLines: 1,
                      action: TextInputAction.done,
                      isObsecure: obSecureConfirmPassword,
                      onSuffixTap: () {
                        setState(() {
                          obSecureConfirmPassword = !obSecureConfirmPassword;
                        });
                      },
                      suffixWidget: Icon(
                        obSecureConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: textColor,
                        size: 25,
                      ),
                      textEditingController: _confirmPassword,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                        height: ScreenDimensions.screenHeight(context) * 0.03),
                    CustomButton(
                      text: Constants.login,
                      onPressed: () async {
                        context.go('/loginWeb');
                      },
                    ),

                  ],
                ),
              ))
        ],
      ),
    );
  }
}
