import 'package:ecommerce_app/common_widgets/bg_widget.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/views/category_screen/category_details.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        //appbar
        appBar: appBar(),
        body: categoryContainer(),
      ),
    );
  }

  //category section
  Widget categoryContainer() {
    var productController = Get.put(ProductController());
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          mainAxisExtent: 200,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              productController.getSubCategories(categoriesList[index]);
              Get.to(() => CategoryDetails(title: categoriesList[index]));
            },
            child: Column(
              children: [
                Image.asset(
                  categoriesImages[index],
                  height: 120,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                Text(
                  categoriesList[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: darkFontGrey,
                  ),
                ),
              ],
            ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make(),
          );
        },
      ),
    );
  }

  //appbar
  AppBar appBar() {
    return AppBar(
      title: const Text(
        categories,
        style: TextStyle(
          fontFamily: bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
