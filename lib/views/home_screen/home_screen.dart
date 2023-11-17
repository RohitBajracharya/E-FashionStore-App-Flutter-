import 'package:ecommerce_app/common_widgets/home_buttons.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/views/home_screen/components/featured_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      color: lightGrey,
      width: screenWidth,
      height: screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            //search field
            searchField(),
            const SizedBox(height: 10),
            //swipers brand
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    swipersBrand(slidersList),
                    const SizedBox(height: 10),
                    //todays deals and flash sale button
                    todayDealsNflashSale(),
                    const SizedBox(height: 10),
                    //second sliders
                    swipersBrand(secondSlidersList),
                    const SizedBox(height: 10),
                    //top categories,brand and top sellers button
                    categoriesBrandSellersButton(),
                    const SizedBox(height: 20),
                    //featured categories text
                    featureCategoryText(),
                    const SizedBox(height: 20),
                    //featured categories list
                    featuredCategoriesList(),
                    const SizedBox(height: 20),
                    // featured product
                    featuredProducts(),
                    const SizedBox(height: 20),
                    //third swiper
                    swipersBrand(secondSlidersList),
                    const SizedBox(height: 20),
                    //all products section
                    allProducts(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //all products
  Widget allProducts() {
    return Column(
      children: [
        //featured product text
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            allProduct,
            style: TextStyle(
              fontFamily: bold,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(height: 10),
        //product list
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 300,
          ),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    imgP5,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  const Spacer(),
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
            );
          },
        ),
      ],
    );
  }

  // featured product
  Widget featuredProducts() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      width: double.infinity,
      decoration: const BoxDecoration(color: redColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //featured product text
          const Text(
            featuredProduct,
            style: TextStyle(
              color: Colors.white,
              fontFamily: bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          //featured product list
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
      ),
    );
  }

  //featured categories list
  Widget featuredCategoriesList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          3,
          (index) => Column(
            children: [
              featuredButton(icon: featuredImages1[index], title: featuresTitles1[index]),
              const SizedBox(height: 10),
              featuredButton(icon: featuredImages2[index], title: featuresTitles2[index]),
            ],
          ),
        ).toList(),
      ),
    );
  }

  //featured categories text
  Widget featureCategoryText() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        featuredCategories,
        style: TextStyle(
          color: darkFontGrey,
          fontSize: 18,
          fontFamily: semibold,
        ),
      ),
    );
  }

  //top categories,brand and top sellers button
  Widget categoriesBrandSellersButton() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          3,
          (index) => homeButtons(
            height: screenHeight * 0.15,
            width: screenWidth / 2.5,
            icon: index == 0
                ? icTopCategories
                : index == 1
                    ? icBrands
                    : icTopSeller,
            title: index == 0
                ? topCategories
                : index == 1
                    ? brand
                    : topSellers,
          ),
        ),
      ),
    );
  }

  //todays deals and flash sale button
  Widget todayDealsNflashSale() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        2,
        (index) => homeButtons(
          height: screenHeight * 0.15,
          width: screenWidth / 2.5,
          icon: index == 0 ? icTodaysDeal : icFlashDeal,
          title: index == 0 ? todayDeal : flashsale,
        ),
      ),
    );
  }

  //swipers brand
  Widget swipersBrand(list) {
    return VxSwiper.builder(
      aspectRatio: 16 / 9,
      autoPlay: true,
      height: 150,
      enlargeCenterPage: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: const BorderRadius.all(Radius.circular(40.0)),
            child: Image.asset(
              list[index],
              fit: BoxFit.fitWidth,
            ),
          ),
        );
      },
    );
  }

  //seachfield
  Widget searchField() {
    return Container(
      alignment: Alignment.center,
      height: 60,
      color: lightGrey,
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search),
          filled: true,
          fillColor: whiteColor,
          hintText: searchanything,
          hintStyle: TextStyle(
            color: textfieldGrey,
          ),
        ),
      ),
    );
  }
}
