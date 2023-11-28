import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/common_widgets/home_buttons.dart';
import 'package:ecommerce_app/common_widgets/loading_indicator.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/views/category_screen/item_details.dart';
import 'package:ecommerce_app/views/home_screen/components/featured_button.dart';
import 'package:ecommerce_app/views/home_screen/search_screen.dart';

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
                    // swipersBrand(secondSlidersList),
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
        productList(),
      ],
    );
  }

  //product list
  StreamBuilder<QuerySnapshot<Object?>> productList() {
    return StreamBuilder(
      stream: FiresstoreServices.getAllProducts(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: loadingIndicator());
        } else {
          var allproductsdata = snapshot.data!.docs;
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: allproductsdata.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 300,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(
                    () => ItemDetails(
                      title: allproductsdata[index]['p_name'],
                      data: allproductsdata[index],
                    ),
                  );
                },
                child: Container(
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
                      Image.network(
                        allproductsdata[index]['p_images'][0],
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      const Spacer(),
                      Text(
                        "${allproductsdata[index]['p_name']}",
                        style: const TextStyle(
                          fontFamily: semibold,
                          color: darkFontGrey,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Rs ${allproductsdata[index]['p_price']}",
                        style: const TextStyle(
                          fontFamily: bold,
                          color: redColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
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
            child: FutureBuilder(
              future: FiresstoreServices.getFeaturedProducts(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: loadingIndicator());
                } else if (snapshot.data!.docs.isEmpty) {
                  return "No Featured Products".text.white.makeCentered();
                } else {
                  var featuredData = snapshot.data!.docs;
                  return featuredProductList(featuredData);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  //featured product list
  Row featuredProductList(List<QueryDocumentSnapshot<Object?>> featuredData) {
    return Row(
      children: List.generate(
        featuredData.length,
        (index) => InkWell(
          onTap: () {
            Get.to(
              () => ItemDetails(
                title: featuredData[index]['p_name'],
                data: featuredData[index],
              ),
            );
          },
          child: Container(
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
                Image.network(
                  featuredData[index]['p_images'][0],
                  width: 150,
                  height: 130,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                Text(
                  featuredData[index]['p_name'],
                  style: const TextStyle(
                    fontFamily: semibold,
                    color: darkFontGrey,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Rs. ${featuredData[index]['p_price']}",
                  style: const TextStyle(
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
    var homeController = Get.find<HomeController>();
    return Container(
      alignment: Alignment.center,
      height: 60,
      color: lightGrey,
      child: TextFormField(
        controller: homeController.searchController,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: const Icon(Icons.search).onTap(() {
            if (homeController.searchController.text.isNotEmptyAndNotNull) {
              Get.to(() => SearchScreen(title: homeController.searchController.text));
            }
          }),
          filled: true,
          fillColor: whiteColor,
          hintText: searchanything,
          hintStyle: const TextStyle(
            color: textfieldGrey,
          ),
        ),
      ),
    );
  }
}
