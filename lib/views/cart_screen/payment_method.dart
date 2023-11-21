import 'package:ecommerce_app/common_widgets/our_button.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/controller/cart_controller.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    var cartController = Get.find<CartController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: appbar(),
      bottomNavigationBar: bottomNavBar(context, cartController),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Obx(
          () => Column(
            children: List.generate(
              paymentMethodsImg.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    cartController.changePaymentIndex(index);
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    margin: const EdgeInsets.only(bottom: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: cartController.paymentIndex.value == index ? redColor : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.asset(
                          paymentMethodsImg[index],
                          width: double.infinity,
                          height: 120,
                          fit: BoxFit.cover,
                          colorBlendMode: cartController.paymentIndex.value == index ? BlendMode.darken : BlendMode.color,
                          color: cartController.paymentIndex.value == index ? Colors.black.withOpacity(0.4) : Colors.transparent,
                        ),
                        cartController.paymentIndex.value == index
                            ? Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  activeColor: Colors.green,
                                  value: true,
                                  onChanged: (value) {},
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                ),
                              )
                            : Container(),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: paymentMethods[index].text.color(lightGrey).fontFamily(semibold).size(16).make(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  //appbar
  AppBar appbar() {
    return AppBar(
      title: "Choose Payment Method".text.fontFamily(semibold).color(darkFontGrey).make(),
    );
  }

  //bottom navbar
  Widget bottomNavBar(context, cartController) {
    return SizedBox(
      height: 60,
      child: ourButton(
        onPress: () {
          cartController.placeMyOrder(
            orderPaymentMethod: paymentMethods[cartController.paymentIndex.value],
            totalAmount: cartController.totalPrice.value,
          );
        },
        color: redColor,
        textColor: whiteColor,
        title: "Place my order",
      ),
    );
  }
}
