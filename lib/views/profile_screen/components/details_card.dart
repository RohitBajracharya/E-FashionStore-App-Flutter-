import 'package:ecommerce_app/consts/consts.dart';

Widget detailsCard({String? count, String? title}) {
  return Container(
    height: 80,
    width: screenWidth / 3.4,
    padding: const EdgeInsets.all(4.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count!,
          style: const TextStyle(fontFamily: bold, color: darkFontGrey, fontSize: 16),
        ),
        const SizedBox(height: 5),
        Text(
          title!,
          style: const TextStyle(color: darkFontGrey),
        ),
      ],
    ),
  );
}
