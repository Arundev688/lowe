import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lowes/core/commonwidgets/button.dart';
import 'package:lowes/core/commonwidgets/textfield.dart';
import 'package:lowes/core/constants/constants.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';

class ForgetPasswordWeb extends StatefulWidget {
  const ForgetPasswordWeb({super.key});

  @override
  State<ForgetPasswordWeb> createState() => _ForgetPasswordWebState();
}

class _ForgetPasswordWebState extends State<ForgetPasswordWeb> {
  final _emailController = TextEditingController();


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
                    Text(Constants.forget, style: AppTextStyle.title),
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
                    Text(Constants.forgetNotes,style: AppTextStyle.textPrime.copyWith(color: primary,fontSize: 13)),
                    SizedBox(
                        height: ScreenDimensions.screenHeight(context) * 0.03),
                    Text(Constants.email, style: AppTextStyle.textPrime),
                    SizedBox(
                        height: ScreenDimensions.screenHeight(context) * 0.012),
                    TextFieldContainer(
                      maxLines: 1,
                      textEditingController: _emailController,
                      action: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                        height: ScreenDimensions.screenHeight(context) * 0.03),
                    CustomButton(
                      text: Constants.sendResetLink,
                      onPressed: () async {},
                    ),
                    SizedBox(
                        height: ScreenDimensions.screenHeight(context) * 0.04),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: Constants.noAccount,
                              style: AppTextStyle.textPrime,
                            ),
                            TextSpan(
                              text: Constants.signUpHere,
                              style: const TextStyle(
                                  color: Colors.blue, fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pushNamed(context,
                                    '/signup'), // Navigate to signup screen
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
