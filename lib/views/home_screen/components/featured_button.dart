import 'package:ecommerce_app/consts/consts.dart';

Widget featuredButton({String? title, icon}) {
  return Container(
    width: 200,
    margin: const EdgeInsets.symmetric(horizontal: 4.0),
    padding: const EdgeInsets.all(4.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 4.0,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      children: [
        Image.asset(
          icon,
          width: 60,
          fit: BoxFit.fill,
        ),
        const SizedBox(width: 10),
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
