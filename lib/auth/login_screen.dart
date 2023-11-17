import 'package:ecommerce_app/auth/signup_screen.dart';
import 'package:ecommerce_app/common_widgets/applogo_widgets.dart';
import 'package:ecommerce_app/common_widgets/bg_widget.dart';
import 'package:ecommerce_app/common_widgets/custom_textfield.dart';
import 'package:ecommerce_app/common_widgets/our_button.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/views/home_screen/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.1),
              applogoWidget(),
              const SizedBox(height: 10),
              //login in to e-Mart text
              const Text(
                "Log in to $appname",
                style: TextStyle(
                  fontFamily: bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              //login form
              loginForm()
            ],
          ),
        ),
      ),
    );
  }

  //login form
  Widget loginForm() {
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
          //email textfield
          customTextField(title: email, hint: emailHint),
          const SizedBox(height: 5),
          //password textfield
          customTextField(title: password, hint: passwordHint),
          //forget password button
          forgetPassword(),
          const SizedBox(height: 5),
          //login button
          loginButton(),
          const SizedBox(height: 5),
          //create new account text
          const Text(
            createNewAccount,
            style: TextStyle(
              color: fontGrey,
            ),
          ),
          const SizedBox(height: 5),
          //signup button
          signupButton(),
          const SizedBox(height: 10),
          //login with text
          const Text(
            loginWith,
            style: TextStyle(
              color: fontGrey,
            ),
          ),
          const SizedBox(height: 5),
          //social app logo
          socialAppLogo(),
        ],
      ),
    );
  }

  // social app logo
  Widget socialAppLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: lightGrey,
            child: Image.asset(
              socialIconList[index],
              width: 30,
            ),
          ),
        ),
      ),
    );
  }

  //signup button
  Widget signupButton() {
    return SizedBox(
      width: screenWidth - 50,
      child: ourButton(
        title: signup,
        color: lightGolden,
        textColor: redColor,
        onPress: () {
          Get.to(() => const SignupScreen());
        },
      ),
    );
  }

  //login button
  Widget loginButton() {
    return SizedBox(
      width: screenWidth - 50,
      child: ourButton(
        title: login,
        color: redColor,
        textColor: whiteColor,
        onPress: () {
          Get.to(const Home());
        },
      ),
    );
  }

  //forget password button
  Widget forgetPassword() {
    return TextButton(
      onPressed: () {},
      child: const Align(
        alignment: Alignment.centerRight,
        child: Text(forgetPass),
      ),
    );
  }
}
