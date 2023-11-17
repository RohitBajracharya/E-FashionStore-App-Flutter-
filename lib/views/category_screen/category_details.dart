// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/common_widgets/bg_widget.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/views/category_screen/item_details.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: appBar(),
        body: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              //sub categories list
              subCategories(),
              const SizedBox(height: 20),
              //product items card
              productItemsCard(),
            ],
          ),
        ),
      ),
    );
  }

  //product items card
  Widget productItemsCard() {
    return Expanded(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 250,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(() => const ItemDetails(title: "Dummy item"));
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
                  Image.asset(
                    imgP5,
                    height: 150,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
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
          );
        },
      ),
    );
  }

  //sub categories list
  Widget subCategories() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          6,
          (index) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              shape: BoxShape.rectangle,
            ),
            width: 120,
            height: 60,
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 4.0),
            child: const Center(
              child: Text(
                "Baby Clothing",
                style: TextStyle(
                  fontFamily: semibold,
                  color: darkFontGrey,
                  fontSize: 12,
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
        title!,
        style: const TextStyle(
          fontFamily: bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
