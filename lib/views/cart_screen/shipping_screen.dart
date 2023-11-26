import 'package:ecommerce_app/common_widgets/custom_textfield.dart';
import 'package:ecommerce_app/common_widgets/our_button.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/views/cart_screen/payment_method.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cartController = Get.put(CartController());

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: appBar(),
      bottomNavigationBar: bottomNavBar(cartController, context),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            //address field
            customTextField(hint: "Address", isPass: false, title: "Address", controller: cartController.addressController),
            //city field
            customTextField(hint: "City", isPass: false, title: "City", controller: cartController.cityController),
            //state field
            customTextField(hint: "State", isPass: false, title: "State", controller: cartController.stateController),
            //phone field
            customTextField(hint: "Phone", isPass: false, title: "Phone", controller: cartController.phoneController),
          ],
        ),
      ),
    );
  }

  //appbar
  AppBar appBar() {
    return AppBar(
      title: "Shipping Info".text.fontFamily(semibold).color(darkFontGrey).make(),
    );
  }

  //bottom navbar
  Widget bottomNavBar(cartController, context) {
    return SizedBox(
      height: 60,
      child: ourButton(
        onPress: () {
          if (cartController.addressController.text.isNotEmpty && cartController.cityController.text.isNotEmpty && cartController.stateController.text.isNotEmpty && cartController.phoneController.text.isNotEmpty) {
            Get.to(() => const PaymentMethods());
          } else {
            VxToast.show(context, msg: "Please fill the form");
          }
        },
        color: redColor,
        textColor: whiteColor,
        title: "Continue",
      ),
    );
  }
}
