import 'package:ecommerce_app/consts/consts.dart';

Widget customTextField({String? title, String? hint, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title!,
        style: const TextStyle(
          color: redColor,
          fontFamily: semibold,
          fontSize: 16,
        ),
      ),
      const SizedBox(height: 5),
      TextField(
        // controller: controller,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontFamily: semibold,
            color: textfieldGrey,
          ),
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: redColor),
          ),
          hintText: hint,
        ),
      ),
      const SizedBox(height: 5),
    ],
  );
}
