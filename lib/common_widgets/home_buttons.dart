import 'package:ecommerce_app/consts/consts.dart';

Widget homeButtons({width, height, icon, String? title, onPress}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5.0),
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 4.0,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon, width: 26),
        const SizedBox(height: 10),
        Text(
          title!,
          style: const TextStyle(
            fontFamily: semibold,
            color: darkFontGrey,
          ),
        ),
      ],
    ),
  );
}
