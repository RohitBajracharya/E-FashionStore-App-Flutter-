import 'package:ecommerce_app/common_widgets/applogo_widgets.dart';
import 'package:ecommerce_app/common_widgets/bg_widget.dart';
import 'package:ecommerce_app/common_widgets/custom_textfield.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/controller/main_controller.dart';

import '../common_widgets/our_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.1),
              //app logo
              applogoWidget(),
              const SizedBox(height: 10),
              //join e-mart text
              const Text(
                "Join the $appname",
                style: TextStyle(
                  fontFamily: bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              //signup form
              signupForm(),
            ],
          ),
        ),
      ),
    );
  }

  //signup form
  Widget signupForm() {
    return Container(
      width: screenWidth - 70,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            offset: Offset(0.0, 5.0),
          ),
        ],
      ),
      child: Column(
        children: [
          //name textfield
          customTextField(title: name, hint: nameHint),
          const SizedBox(height: 5),
          //email textfield
          customTextField(title: email, hint: emailHint),
          const SizedBox(height: 5),
          //password textfield
          customTextField(title: password, hint: passwordHint),
          const SizedBox(height: 5),
          //retype password textfield
          customTextField(title: retypePassword, hint: passwordHint),
          //forget password button
          forgetPasswordButton(),
          const SizedBox(height: 5),
          //terms and policy
          termsNpolicy(),
          //signup button
          signupButton(),
          const SizedBox(height: 10),
          //login button
          loginButton(),
        ],
      ),
    );
  }

  //login button
  Widget loginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // already have an account text
        const Text(
          alreadyHaveAccount,
          style: TextStyle(
            fontFamily: bold,
            color: fontGrey,
          ),
        ),
        // login button
        InkWell(
          onTap: () {
            Get.back();
          },
          child: const Text(
            login,
            style: TextStyle(
              fontFamily: bold,
              color: redColor,
            ),
          ),
        ),
      ],
    );
  }

  //signup button
  Widget signupButton() {
    return SizedBox(
      width: screenWidth - 50,
      child: Obx(
        () => ourButton(
          title: signup,
          color: mainController.isCheck?.value == true ? redColor : lightGrey,
          textColor: mainController.isCheck?.value == true ? whiteColor : darkFontGrey,
          onPress: () {},
        ),
      ),
    );
  }

  //terms and policy
  Widget termsNpolicy() {
    return Row(
      children: [
        Obx(
          () => Checkbox(
            activeColor: redColor,
            checkColor: whiteColor,
            value: mainController.isCheck?.value,
            onChanged: (value) {
              mainController.isCheck?.value = !mainController.isCheck!.value;
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "I agree to the ",
                  style: TextStyle(
                    fontFamily: regular,
                    color: fontGrey,
                  ),
                ),
                TextSpan(
                  text: termAndCond,
                  style: TextStyle(
                    fontFamily: regular,
                    color: redColor,
                  ),
                ),
                TextSpan(
                  text: " & ",
                  style: TextStyle(
                    fontFamily: regular,
                    color: fontGrey,
                  ),
                ),
                TextSpan(
                  text: privacyPolicy,
                  style: TextStyle(
                    fontFamily: regular,
                    color: redColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  //forget password button
  Widget forgetPasswordButton() {
    return TextButton(
      onPressed: () {},
      child: const Align(
        alignment: Alignment.centerRight,
        child: Text(forgetPass),
      ),
    );
  }
}
