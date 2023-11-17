import 'package:ecommerce_app/consts/consts.dart';

Widget applogoWidget() {
  return Container(
    width: 77,
    height: 77,
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
    ),
    child: Image.asset(icAppLogo),
  );
}
