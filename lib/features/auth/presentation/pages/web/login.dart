import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lowes/core/commonwidgets/button.dart';
import 'package:lowes/core/commonwidgets/textfield.dart';
import 'package:lowes/core/constants/constants.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';

class WebLogin extends StatefulWidget {
  const WebLogin({super.key});

  @override
  State<WebLogin> createState() => _WebLoginState();
}

class _WebLoginState extends State<WebLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var obSecurePassword = true;
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Row(
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
                    Text(Constants.login, style: AppTextStyle.title),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              checkColor: white,
                              activeColor: primary,
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text(
                              Constants.remember,
                              style: AppTextStyle.textPrime,
                            )
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            context.go('/forgetWeb');
                          },
                          child: Text(
                            Constants.forget,
                            style:
                            AppTextStyle.textPrime.copyWith(color: primary),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: ScreenDimensions.screenHeight(context) * 0.03),
                    CustomButton(
                      text: Constants.login,
                      onPressed: () async {
                        context.go('/dashboardWeb');
                      },
                    ),
                    SizedBox(
                        height: ScreenDimensions.screenHeight(context) * 0.03),
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
