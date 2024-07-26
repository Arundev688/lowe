import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lowes/core/commonwidgets/button.dart';
import 'package:lowes/core/commonwidgets/textfield.dart';
import 'package:lowes/core/commonwidgets/toast.dart';
import 'package:lowes/core/constants/constants.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';
import 'package:lowes/features/auth/presentation/provider/auth_provider.dart';
import 'package:lowes/features/auth/presentation/provider/auth_state_provider.dart';
import 'package:provider/provider.dart';

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
    final authState = Provider.of<AuthStateProvider>(context);

    return Consumer<AuthProvider>(builder: (ctx, provider, child) {
      return Scaffold(
        body: Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  color: primaryLight,
                  height: double.infinity,
                  child:
                      Image.asset("assets/png/web_login.png", fit: BoxFit.fitWidth),
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
                      Image.asset("assets/png/hutrac_logo.png",
                          width: ScreenDimensions.screenWidth(context) * 0.4,
                          height: ScreenDimensions.screenHeight(context) * 0.1),
                      SizedBox(
                          height:
                              ScreenDimensions.screenHeight(context) * 0.05),
                      Text(Constants.login, style: AppTextStyle.title),
                      SizedBox(
                          height:
                              ScreenDimensions.screenHeight(context) * 0.08),
                      TextFieldContainer(
                        maxLines: 1,
                        height: ScreenDimensions.screenHeight(context) * 0.1,
                        hint: Constants.email,
                        textEditingController: _emailController,
                        action: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                        suffixWidget: const Icon(Icons.email_outlined),
                      ),
                      SizedBox(
                          height:
                              ScreenDimensions.screenHeight(context) * 0.05),
                      TextFieldContainer(
                        maxLines: 1,
                        height: ScreenDimensions.screenHeight(context) * 0.1,
                        action: TextInputAction.done,
                        isObsecure: obSecurePassword,
                        hint: Constants.password,
                        onSuffixTap: () {
                          setState(() {
                            obSecurePassword = !obSecurePassword;
                          });
                        },
                        suffixWidget: Icon(
                          obSecurePassword
                              ? Icons.lock_outlined
                              : Icons.lock_open_rounded,
                          color: textColor,
                          size: 25,
                        ),
                        textEditingController: _passwordController,
                        textInputType: TextInputType.visiblePassword,
                      ),
                      SizedBox(
                          height:
                              ScreenDimensions.screenHeight(context) * 0.05),
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
                              style: AppTextStyle.textPrime
                                  .copyWith(color: primary),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height:
                              ScreenDimensions.screenHeight(context) * 0.05),
                      authState.state == AuthState.loading
                          ? const Center(child: CircularProgressIndicator())
                          : CustomButton(
                              text: Constants.login,
                              onPressed: () async {
                                final errorMessage =
                                    provider.validateLoginFields(
                                        _emailController.text,
                                        _passwordController.text);
                                if (errorMessage != null) {
                                  showSnackBar(context, errorMessage,
                                      true); // Display error message
                                  return; // Prevent login call if validation fails
                                } else {
                                  provider.userLogin(_emailController.text,
                                      _passwordController.text, context, false);
                                }
                              },
                            ),
                    ],
                  ),
                ))
          ],
        ),
      );
    });
  }
}
