import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/common_widgets/loading_indicator.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/services/firestore_services.dart';

import '../category_screen/item_details.dart';

class SearchScreen extends StatelessWidget {
  final String? title;
  const SearchScreen({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).make(),
      ),
      body: FutureBuilder(
        future: FiresstoreServices.searchProducts(title),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: loadingIndicator());
          } else if (snapshot.data!.docs.isEmpty) {
            return "No products found".text.makeCentered();
          } else {
            var data = snapshot.data!.docs;
            var filtered = data.where((element) => element['p_name'].toString().toLowerCase().contains(title!.toLowerCase())).toList();
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 300,
                ),
                children: filtered.mapIndexed((currentValue, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        filtered[index]['p_images'][0],
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      const Spacer(),
                      Text(
                        "${filtered[index]['p_name']}",
                        style: const TextStyle(
                          fontFamily: semibold,
                          color: darkFontGrey,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Rs ${filtered[index]['p_price']}",
                        style: const TextStyle(
                          fontFamily: bold,
                          color: redColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ).box.white.outerShadowMd.margin(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(const EdgeInsets.all(12)).make().onTap(() {
                    Get.to(() => ItemDetails(title: filtered[index]['p_name'], data: filtered[index]));
                  });
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
