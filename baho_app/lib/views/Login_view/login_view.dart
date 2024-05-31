import 'package:baho_app/consts/consts.dart';
import 'package:baho_app/consts/images.dart';
import 'package:baho_app/consts/strings.dart';
import 'package:baho_app/res/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:baho_app/res/components/custom_textfield.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.logo,
                  width: 200,
                ),
                10.heightBox,
                AppStyles.bold(title: AppStrings.welcomeBack, size:AppFontSizes.large),
                //AppStrings.welcomeBack.text.make(),
              ],
            )),
            30.heightBox,
            Expanded(
                child: Container(
                    color: Color.fromARGB(255, 240, 247, 250),
                    child: Form(
                      child:SingleChildScrollView(
                         child: Column(
                      
                      children: [
                        CustomTextfield(hint: AppStrings.emailHint),
                        SizedBox(height: 20.0),
                        CustomTextfield(hint: AppStrings.passwordHint),
                        SizedBox(height: 20.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AppStrings.forgetPassword.text.make(),
                        ),
                        SizedBox(height: 20.0),
                        CustomButton(
                            buttonText: AppStrings.login, onTap: () {}),
                        20.0.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppStrings.dontHaveAccount.text.make(),
                            8.widthBox,
                            AppStrings.signUp.text.blue500.make()
                          ],
                        )
                      ],
                    )
                      )
                       )))
          ],
        ),
      ),
    );
  }
}
