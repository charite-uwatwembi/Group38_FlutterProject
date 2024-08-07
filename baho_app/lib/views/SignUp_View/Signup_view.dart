import 'package:baho_app/consts/consts.dart';
import 'package:baho_app/consts/images.dart';
import 'package:baho_app/consts/strings.dart';
import 'package:baho_app/controllers/auth_controller.dart';
import 'package:baho_app/res/components/custom_button.dart';
import 'package:baho_app/views/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:baho_app/consts/fonts.dart';
import 'package:baho_app/views/Login_view/login_view.dart';
import 'package:baho_app/res/components/custom_textfield.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
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
                  AppAssets.baho,
                  width: 200,
                ),
                10.heightBox,
                AppStyles.bold(
                    title: AppStrings.welcomMsg, size: AppFontSizes.large),
                AppStyles.bold(
                    title: AppStrings.getStarted,
                    size: AppFontSizes.large,
                    alignment: TextAlign.center),
                //AppStrings.welcomeBack.text.make(),
              ],
            )),
            30.heightBox,
            Expanded(
                child: Container(
                    child: Form(
                        child: SingleChildScrollView(
                            child: Column(
              children: [
                CustomTextfield(
                    hint: AppStrings.nameHint,
                    textController: controller.fullnameController),
                SizedBox(height: 20.0),
                CustomTextfield(
                    hint: AppStrings.emailHint,
                    textController: controller.emailController),
                SizedBox(height: 20.0),
                CustomTextfield(
                    hint: AppStrings.passwordHint,
                    textController: controller.passwordController),
                SizedBox(height: 20.0),
                CustomButton(
                    buttonText: AppStrings.signUp,
                    onTap: () async {
                      await controller.signupUser();
                      if (controller.userCredential != null) {
                        Get.offAll(() => const HomeView());
                      }
                    }),
                20.0.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppStrings.haveAccount.text.make(),
                    8.widthBox,
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: AppStyles.bold(
                        title: AppStrings.login,
                        color: AppColors.primaryColor,
                      ),
                    )
                  ],
                )
              ],
            )))))
          ],
        ),
      ),
    );
  }
}
