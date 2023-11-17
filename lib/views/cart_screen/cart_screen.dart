import 'package:ecommerce_app/consts/consts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:const Center(
        child: Text(
          "Cart is Empty!",
          style: TextStyle(fontFamily: semibold, color: darkFontGrey),
        ),
      ),
    );
  }
}
