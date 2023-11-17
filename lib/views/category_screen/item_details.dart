// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/common_widgets/our_button.dart';
import 'package:ecommerce_app/consts/consts.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: appBar(),
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
                    imageSwiper(),
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
                    ratings(),
                    const SizedBox(height: 10),
                    //price
                    price(),
                    const SizedBox(height: 10),
                    // seller name and message box
                    sellerNmessagebox(),
                    const SizedBox(height: 20),
                    //color section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //color
                        colorSection(),
                        //quantity
                        quantitySection(),
                        //total
                        totalSection(),
                        const SizedBox(height: 10),
                        //description
                        descriptionSection(),
                        const SizedBox(height: 10),
                        //button section
                        buttonSection(),
                        const SizedBox(height: 10),
                        //products you may like
                        productYouMayLike(),
                      ],
                    ).box.white.shadowSm.make(),
                  ],
                ),
              ),
            ),
          ),
          //add to cart
          addToCardButton()
        ],
      ),
    );
  }

  SizedBox addToCardButton() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ourButton(
        color: redColor,
        onPress: () {},
        textColor: whiteColor,
        title: "Add to cart",
      ),
    );
  }

  //products you may like
  Widget productYouMayLike() {
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
  ListView buttonSection() {
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
  Widget descriptionSection() {
    return const Column(
      children: [
        Text(
          "Description",
          style: TextStyle(
            color: darkFontGrey,
            fontFamily: semibold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "This is a dummy item and dummy description here... sadflkajsdfkjkalsdjfkljsadklfj kajsdlkfjkl jklajs dfkjlkasdj flkjkasd fkljsdklfj lkasdfj ",
          style: TextStyle(
            color: darkFontGrey,
          ),
        ),
      ],
    );
  }

  //total section widget
  Widget totalSection() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              "Total: ",
              style: TextStyle(
                color: textfieldGrey,
              ),
            ),
          ),
          Text(
            "\$0.0",
            style: TextStyle(
              color: redColor,
              fontSize: 16,
              fontFamily: bold,
            ),
          ),
        ],
      ),
    );
  }

  //quantity section widget
  Widget quantitySection() {
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
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove),
              ),
              const Text(
                "0",
                style: TextStyle(
                  color: darkFontGrey,
                  fontSize: 16,
                  fontFamily: bold,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
              const SizedBox(width: 10),
              const Text(
                "(0 available)",
                style: TextStyle(
                  color: textfieldGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //color section widget
  Widget colorSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
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
              3,
              (index) => Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 6.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Vx.randomPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // seller name and message box
  Widget sellerNmessagebox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 60,
      color: textfieldGrey,
      child: const Row(
        children: [
          Expanded(
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
            child: Icon(
              Icons.message_rounded,
              color: darkFontGrey,
            ),
          )
        ],
      ),
    );
  }

  //price
  Widget price() {
    return const Text(
      "\$30,000",
      style: TextStyle(
        fontSize: 18,
        color: redColor,
        fontFamily: bold,
      ),
    );
  }

//ratings
  Widget ratings() {
    return VxRating(
      onRatingUpdate: (value) {},
      normalColor: textfieldGrey,
      selectionColor: golden,
      count: 5,
      size: 25,
      stepInt: true,
    );
  }

  //image swiper
  Widget imageSwiper() {
    return VxSwiper.builder(
      autoPlay: true,
      height: 350,
      itemCount: 3,
      aspectRatio: 16 / 9,
      itemBuilder: (context, index) {
        return Image.asset(
          imgFc5,
          width: double.infinity,
          fit: BoxFit.cover,
        );
      },
    );
  }

//appbar
  AppBar appBar() {
    return AppBar(
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
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_outline),
        ),
      ],
    );
  }
}
