import 'package:flutter/material.dart';
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

class MobileLogin extends StatefulWidget {
  const MobileLogin({super.key});

  @override
  State<MobileLogin> createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var obSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AuthStateProvider>(context);
    return Consumer<AuthProvider>(builder: (ctx, provider, child) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenDimensions.screenWidth(context) * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Constants.login, style: AppTextStyle.title),
            SizedBox(
                height: ScreenDimensions.screenHeight(context) *
                    0.008),
            const Divider(
              thickness: 0.5,
              color: lightText,
              indent: 5,
              endIndent: 5,
            ),
            SizedBox(
                height: ScreenDimensions.screenHeight(context) *
                    0.03),
            Text(Constants.email, style: AppTextStyle.textPrime),
            SizedBox(
                height: ScreenDimensions.screenHeight(context) *
                    0.012),
            TextFieldContainer(
              maxLines: 1,
              textEditingController: _emailController,
              action: TextInputAction.next,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
                height: ScreenDimensions.screenHeight(context) *
                    0.03),
            Text(Constants.password, style: AppTextStyle.textPrime),
            SizedBox(
                height: ScreenDimensions.screenHeight(context) *
                    0.012),
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
                height: ScreenDimensions.screenHeight(context) *
                    0.03),
            authState.state == AuthState.loading ?
            const Center(child: CircularProgressIndicator()) :
            CustomButton(
              text: Constants.login,
              onPressed: () async {
                final errorMessage = provider.validateLoginFields(_emailController.text, _passwordController.text);
                if (errorMessage != null) {
                  showSnackBar(context, errorMessage, true); // Display error message
                  return; // Prevent login call if validation fails
                } else {
                  provider.userLogin(_emailController.text, _passwordController.text, context,true);
                }
              },
            ),
            SizedBox(
                height: ScreenDimensions.screenHeight(context) *
                    0.03),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {

                },
                child: Text(
                  Constants.forget,
                  style:
                  AppTextStyle.textPrime.copyWith(color: primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    });
  }
}
