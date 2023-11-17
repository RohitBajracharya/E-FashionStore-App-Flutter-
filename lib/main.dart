import 'package:ecommerce_app/views/splash_screen/splash_screen.dart';

import './consts/consts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
        fontFamily: regular,
      ),
      home: const SplashScreen(),
      defaultTransition: Transition.leftToRightWithFade,
    );
  }
}
