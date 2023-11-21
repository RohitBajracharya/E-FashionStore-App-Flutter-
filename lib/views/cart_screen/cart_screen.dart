import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/common_widgets/loading_indicator.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/views/cart_screen/shipping_screen.dart';

import '../../common_widgets/our_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: shippingButton(),
      appBar: appBar(),
      body: StreamBuilder(
        stream: FiresstoreServices.getCart(currentUser!.uid),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: loadingIndicator());
          } else if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                "Cart is Empty",
                style: TextStyle(color: darkFontGrey),
              ),
            );
          } else {
            return cartBody(snapshot);
          }
        },
      ),
    );
  }

  //cart body
  Widget cartBody(snapshot) {
    var cartController = Get.put(CartController());
    var data = snapshot.data!.docs;
    cartController.calculateTotalPrice(data);
    cartController.productSnapshot = data;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          //cart items
          cartItems(data),
          //total price
          totalPrice(cartController).box.padding(const EdgeInsets.all(12)).color(lightGolden).width(screenWidth - 60).roundedSM.make(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  //Shipping button
  Widget shippingButton() {
    return SizedBox(
      height: 60,
      child: ourButton(
        color: redColor,
        onPress: () {
          Get.to(() => const ShippingScreen());
        },
        textColor: whiteColor,
        title: "Process to shipping",
      ),
    );
  }

  //total price
  Widget totalPrice(CartController cartController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Total Price",
          style: TextStyle(
            fontFamily: bold,
            color: darkFontGrey,
          ),
        ),
        Obx(
          () => Text(
            "Rs ${cartController.totalPrice.value}",
            style: const TextStyle(
              fontFamily: bold,
              color: redColor,
            ),
          ),
        ),
      ],
    );
  }

  //cart items
  Widget cartItems(data) {
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            //product image
            leading: Image.network('${data[index]['p_images']}'),
            //product title and quantity
            title: Text(
              "${data[index]['title']} (*${data[index]['quantity']})",
              style: const TextStyle(
                fontFamily: semibold,
                fontSize: 16,
              ),
            ),
            //product price
            subtitle: Text(
              "Rs ${data[index]['total_price']}",
              style: const TextStyle(
                color: redColor,
                fontFamily: semibold,
              ),
            ),
            //delete button
            trailing: const Icon(
              Icons.delete,
              color: redColor,
            ).onTap(() {
              FiresstoreServices.deleteCartItem(data[index].id);
            }),
          );
        },
      ),
    );
  }

  //appbar
  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
        "Shopping Cart",
        style: TextStyle(color: darkFontGrey, fontFamily: semibold),
      ),
    );
  }
}
