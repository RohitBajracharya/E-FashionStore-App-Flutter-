// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/common_widgets/our_button.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/views/chat_screen/chat_screen.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;
  const ItemDetails({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productController = Get.find<ProductController>();

    return WillPopScope(
      onWillPop: () async {
        productController.resetValues();
        return true;
      },
      child: Scaffold(
        backgroundColor: lightGrey,
        appBar: appBar(context),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //swiper section
                      imageSwiper(data),
                      const SizedBox(height: 10),
                      //title and details section
                      Text(
                        title!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: darkFontGrey,
                          fontFamily: semibold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      //ratings
                      ratings(data),
                      const SizedBox(height: 10),
                      //price
                      price(data),
                      const SizedBox(height: 10),
                      // seller name and message box
                      sellerNmessagebox(data),
                      const SizedBox(height: 20),
                      //color section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //color
                          colorSection(data),
                          //quantity
                          quantitySection(data),
                          //total
                          totalSection(data),
                          const SizedBox(height: 10),
                          //description
                          descriptionSection(data),
                          const SizedBox(height: 10),
                          //button section
                          buttonSection(data),
                          const SizedBox(height: 10),
                          //products you may like
                          productYouMayLike(data),
                        ],
                      ).box.white.shadowSm.make(),
                    ],
                  ),
                ),
              ),
            ),
            //add to cart
            addToCardButton(data, context),
          ],
        ),
      ),
    );
  }

  //add to cart button
  Widget addToCardButton(data, context) {
    var productController = Get.find<ProductController>();
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ourButton(
        color: redColor,
        onPress: () {
          productController.addToCart(color: data['p_colors'][productController.colorIndex.value], context: context, img: data['p_images'][0], quantity: productController.quantity.value, sellername: data['p_seller'], title: data['p_name'], totalPrice: productController.totalPrice.value);
          VxToast.show(context, msg: "Added to cart");
        },
        textColor: whiteColor,
        title: "Add to cart",
      ),
    );
  }

  //products you may like
  Widget productYouMayLike(data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //product you may like text
        const Text(
          productsyoumaylike,
          style: TextStyle(
            fontFamily: bold,
            fontSize: 16,
            color: darkFontGrey,
          ),
        ),
        const SizedBox(height: 10),
        //products list
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              6,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      imgP1,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Laptop 4GB/64GB",
                      style: TextStyle(
                        fontFamily: semibold,
                        color: darkFontGrey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "\$600",
                      style: TextStyle(
                        fontFamily: bold,
                        color: redColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  //button section
  ListView buttonSection(data) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(
        itemDetailButtonList.length,
        (index) => ListTile(
          title: Text(
            itemDetailButtonList[index],
            style: const TextStyle(
              fontFamily: semibold,
              color: darkFontGrey,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }

  //description
  Widget descriptionSection(data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Description",
          style: TextStyle(
            color: darkFontGrey,
            fontFamily: semibold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "${data['p_description']}",
          style: const TextStyle(
            color: darkFontGrey,
          ),
        ),
      ],
    );
  }

  //total section widget
  Widget totalSection(data) {
    var productController = Get.find<ProductController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => Row(
          children: [
            const SizedBox(
              width: 100,
              child: Text(
                "Total: ",
                style: TextStyle(
                  color: textfieldGrey,
                ),
              ),
            ),
            Text(
              "Rs ${productController.totalPrice.value.numCurrency}",
              style: const TextStyle(
                color: redColor,
                fontSize: 16,
                fontFamily: bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //quantity section widget
  Widget quantitySection(data) {
    var productController = Get.find<ProductController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const SizedBox(
            width: 100,
            child: Text(
              "Quantity: ",
              style: TextStyle(
                color: textfieldGrey,
              ),
            ),
          ),
          Obx(
            () => Row(
              children: [
                IconButton(
                  onPressed: () {
                    productController.decreaseQuantity();
                    productController.calculateTotalPrice(int.parse(data['p_price']));
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  productController.quantity.value.toString(),
                  style: const TextStyle(
                    color: darkFontGrey,
                    fontSize: 16,
                    fontFamily: bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    productController.increaseQuantity(int.parse(data['p_quantity']));
                    productController.calculateTotalPrice(int.parse(data['p_price']));
                  },
                  icon: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
                Text(
                  "(${data['p_quantity']} available)",
                  style: const TextStyle(
                    color: textfieldGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //color section widget
  Widget colorSection(data) {
    var productController = Get.find<ProductController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => Row(
          children: [
            const SizedBox(
              width: 100,
              child: Text(
                "Color: ",
                style: TextStyle(
                  color: textfieldGrey,
                ),
              ),
            ),
            Row(
              children: List.generate(
                data['p_colors'].length,
                (index) => Stack(
                  alignment: Alignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        productController.changeColorIndex(index);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: const EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(data['p_colors'][index]).withOpacity(1.0),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: index == productController.colorIndex.value,
                      child: const Icon(Icons.done, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // seller name and message box
  Widget sellerNmessagebox(data) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 60,
      color: textfieldGrey,
      child: Row(
        children: [
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Seller",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: semibold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "In House Brands",
                  style: TextStyle(
                    fontSize: 16,
                    color: darkFontGrey,
                    fontFamily: semibold,
                  ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.message_rounded,
              color: darkFontGrey,
            ).onTap(() {
              Get.to(
                () => const ChatScreen(),
                arguments: [data['p_seller'], data['vendor_id']],
              );
            }),
          ),
        ],
      ),
    );
  }

  //price
  Widget price(data) {
    return Text(
      "Rs ${data['p_price'].toString().numCurrency}",
      style: const TextStyle(
        fontSize: 18,
        color: redColor,
        fontFamily: bold,
      ),
    );
  }

//ratings
  Widget ratings(data) {
    return VxRating(
      isSelectable: false,
      value: double.parse(data['p_rating']),
      onRatingUpdate: (value) {},
      normalColor: textfieldGrey,
      selectionColor: golden,
      count: 5,
      size: 25,
      maxRating: 5,
    );
  }

  //image swiper
  Widget imageSwiper(data) {
    return VxSwiper.builder(
      autoPlay: true,
      height: 350,
      itemCount: data['p_images'].length,
      aspectRatio: 16 / 9,
      viewportFraction: 1.0,
      itemBuilder: (context, index) {
        return Image.network(
          data['p_images'][index],
          width: double.infinity,
          fit: BoxFit.cover,
        );
      },
    );
  }

//appbar
  AppBar appBar(context) {
    var productController = Get.find<ProductController>();
    return AppBar(
      leading: IconButton(
        onPressed: () {
          productController.resetValues();
          Get.back();
        },
        icon: const Icon(Icons.arrow_back),
      ),
      title: Text(
        title!,
        style: const TextStyle(
          fontFamily: bold,
          color: darkFontGrey,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share),
        ),
        Obx(
          () => IconButton(
            onPressed: () {
              if (productController.isFav.value) {
                productController.removeFromWishlist(data.id, context);
              } else {
                productController.addToWishlist(data.id, context);
              }
            },
            icon: Icon(
              Icons.favorite_outlined,
              color: productController.isFav.value ? redColor : darkFontGrey,
            ),
          ),
        ),
      ],
    );
  }
}
