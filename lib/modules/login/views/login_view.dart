
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../utils/app_scaffold.dart';
import '../../../utils/common/colors.dart';
import '../../../generated/assets.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/common/common.dart';
import '../../../utils/component/app_widgets.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hideAppBar: true,
      isLoading: loginController.isLoading,
      resizeToAvoidBottomPadding: true,
      body: Container(
        color: Colors.white,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        Center(
                          child: Image.asset(
                            Assets.imagesLogin,
                            height: Get.height * .3,
                          ),
                        ),
                        8.height,
                        Text(
                          "Welcome To MediObserve",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: appBackGroundColor,
                          ),
                        ),
                        10.height,
                        Text(
                          "Login to continue",
                          style: boldTextStyle(size: 16, color: appTextColor),
                        ),
                        30.height,
                        buildTextField(
                          controller: loginController.emailCont,
                          hintText: "Username",
                          icon: Icons.person,
                        ),
                        20.height,
                        Obx(() => buildTextField(
                              controller: loginController.passwordCont,
                              hintText: "Password",
                              icon: Icons.lock,
                              obscureText: !loginController.isPasswordVisible.value,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  loginController.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                                  color: appBackGroundColor,
                                ),
                                onPressed: () => loginController.isPasswordVisible.toggle(),
                              ),
                            )),
                        15.height,
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.FORGOTPASSWORD);
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: appBackGroundColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        AppButtonWidget(
                          shapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          buttonColor: appBackGroundColor,
                          text: "Login",
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: appWhiteColor,
                            fontSize: 18,
                          ),
                          width: double.infinity,
                          onTap: () {
                            loginController.loginUser();
                          },
                        ),
                        10.height,
                        _buildButton(
                          "Sign in with Google",
                          16,
                          FontWeight.w600,
                          appWhiteColor,
                          appTextColor,
                          () {
                            loginController.loginWithGoogle();
                          },
                          icon: Icons.login,
                        ),
                        20.height,
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Custom Button Widget
  Widget _buildButton(String text, double fontSize, FontWeight fontWeight, Color color, Color textColor, VoidCallback onPressed, {IconData? icon}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: icon != null
            ? SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(Assets.logosIcGoogle, fit: BoxFit.contain),
              )
            : const SizedBox.shrink(),
        label: Text(
          text,
          style: TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: textColor),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 3,
        ),
      ),
    );
  }
}
