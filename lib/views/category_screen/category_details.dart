// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/common_widgets/bg_widget.dart';
import 'package:ecommerce_app/common_widgets/loading_indicator.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/views/category_screen/item_details.dart';

class CategoryDetails extends StatefulWidget {
  final String? title;
  const CategoryDetails({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  void initState() {
    super.initState();
    switchCategory(widget.title);
  }

  switchCategory(title) {
    if (productController.subCat.contains(title)) {
      productMethod = FiresstoreServices.getSubCategoryProducts(title);
    } else {
      productMethod = FiresstoreServices.getProducts(title);
    }
  }

  var productController = Get.find<ProductController>();
  dynamic productMethod;

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: appBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              //sub categories list
              subCategories(),
              const SizedBox(height: 20),
              StreamBuilder(
                stream: productMethod,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(child: Center(child: loadingIndicator()));
                  } else if (snapshot.data!.docs.isEmpty) {
                    return const Expanded(
                      child: Center(
                        child: Text(
                          "No products found",
                          style: TextStyle(color: darkFontGrey),
                        ),
                      ),
                    );
                  } else {
                    var data = snapshot.data!.docs;
                    return productItemsCard(data);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //product items card
  Widget productItemsCard(data) {
    return Expanded(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 250,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              var productController = Get.find<ProductController>();
              productController.checkIfFav(data[index]);
              Get.to(() => ItemDetails(
                    title: "${data[index]['p_name']}",
                    data: data[index],
                  ));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4.0,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    data[index]['p_images'][0],
                    height: 160,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    data[index]['p_name'].toString(),
                    style: const TextStyle(
                      fontFamily: semibold,
                      color: darkFontGrey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Rs ${data[index]['p_price'].toString().numCurrency}",
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
      ),
    );
  }

  //sub categories list
  Widget subCategories() {
    var productController = Get.find<ProductController>();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          productController.subCat.length,
          (index) => InkWell(
            onTap: () {
              switchCategory(productController.subCat[index].toString());
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                shape: BoxShape.rectangle,
              ),
              width: 120,
              height: 60,
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 4.0),
              child: Center(
                child: Text(
                  productController.subCat[index].toString(),
                  style: const TextStyle(
                    fontFamily: semibold,
                    color: darkFontGrey,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

//appbar
  AppBar appBar() {
    return AppBar(
      title: Text(
        widget.title!,
        style: const TextStyle(
          fontFamily: bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
