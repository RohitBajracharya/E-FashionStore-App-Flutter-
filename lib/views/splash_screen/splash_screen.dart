import 'package:ecommerce_app/auth/login_screen.dart';
import 'package:ecommerce_app/common_widgets/applogo_widgets.dart';
import 'package:ecommerce_app/consts/consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // creating method to chnage screen
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () => Get.to(() => const LoginScreen()));
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            //background image
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                icSplashBg,
                width: 300,
              ),
            ),
            const SizedBox(height: 20),
            //app logo
            applogoWidget(),
            const SizedBox(height: 10),
            //app name
            const Text(
              appname,
              style: TextStyle(
                fontFamily: bold,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            //app version
            const Text(
              appversion,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const Spacer(),
            //app credits
            const Text(
              credits,
              style: TextStyle(
                fontFamily: semibold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
