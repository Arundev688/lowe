import 'package:flutter/material.dart';
import 'package:lowes/core/commonwidgets/button.dart';
import 'package:lowes/core/commonwidgets/textfield.dart';
import 'package:lowes/core/commonwidgets/toast.dart';
import 'package:lowes/core/constants/constants.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';
import 'package:lowes/features/auth/presentation/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class MobileLogin extends StatefulWidget {
  const MobileLogin({super.key});

  @override
  State<MobileLogin> createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {
  var obSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (ctx, provider, child) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: lightGray,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenDimensions.screenWidth(context) * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/png/hutrac_logo.png",width:ScreenDimensions.screenWidth(context) * 0.4,height: ScreenDimensions.screenHeight(context) * 0.1),
              SizedBox(
                  height: ScreenDimensions.screenHeight(context) *
                      0.06),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(Constants.login, style: AppTextStyle.title1)),
              SizedBox(
                  height: ScreenDimensions.screenHeight(context) *
                      0.06),
              TextFieldContainer(
                maxLines: 1,
                height: ScreenDimensions.screenHeight(context) * 0.08,
                textEditingController: provider.emailController,
                action: TextInputAction.next,
                onChanged: (value) => provider.updateEmail(value),
                hint: Constants.email,
                textInputType: TextInputType.emailAddress,
                suffixWidget: const Icon(Icons.email_outlined),
              ),
              SizedBox(
                  height: ScreenDimensions.screenHeight(context) *
                      0.03),
              TextFieldContainer(
                maxLines: 1,
                height: ScreenDimensions.screenHeight(context) * 0.08,
                action: TextInputAction.done,
                isObsecure: obSecurePassword,
                onChanged: (value) => provider.updatePassword(value),
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
                textEditingController: provider.passwordController,
                textInputType: TextInputType.visiblePassword,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
      
                  },
                  child: Text(
                    Constants.forget,
                    style: AppTextStyle.textPrime.copyWith(color: primary,fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                  height: ScreenDimensions.screenHeight(context) *
                      0.03),
              provider.loginLoading ?
              const Center(child: CircularProgressIndicator()) :
              CustomButton(
                text: Constants.login,
                buttonColor: provider.isValidFields() ? primary : lightText,
                height: ScreenDimensions.screenHeight(context) * 0.05,
                onPressed:  provider.isValidFields() ?  () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  final errorMessage = provider.validateLoginFields(provider.emailController.text, provider.passwordController.text);
                  if (errorMessage != null) {
                    showSnackBar(context, errorMessage, true);
                    provider.updatePassword("");
                    provider.updateEmail("");
                    return;
                  } else {
                   await provider.userLogin(provider.emailController.text.toString(), provider.passwordController.text.toString(), context,true);
                  }
                } : () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  provider.updatePassword("");
                  provider.updateEmail("");
                  showSnackBar(context, "Fields are empty", true);
                },
              ),
            ],
          ),
        ),
      ),
    );
    });
  }
}
