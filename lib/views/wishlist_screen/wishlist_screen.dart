import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/common_widgets/loading_indicator.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/services/firestore_services.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "My Wishlist".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
        stream: FiresstoreServices.getWishlists(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: loadingIndicator());
          } else if (snapshot.data!.docs.isEmpty) {
            return "No wishlist yet!".text.color(darkFontGrey).makeCentered();
          } else {
            var data = snapshot.data!.docs;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        //product image
                        leading: Image.network(
                          '${data[index]['p_images'][0]}',
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                        //product title and quantity
                        title: Text(
                          "${data[index]['p_name']}",
                          style: const TextStyle(
                            fontFamily: semibold,
                            fontSize: 16,
                          ),
                        ),
                        //product price
                        subtitle: Text(
                          "Rs ${data[index]['p_price']}",
                          style: const TextStyle(
                            color: redColor,
                            fontFamily: semibold,
                          ),
                        ),
                        //delete button
                        trailing: const Icon(
                          Icons.favorite,
                          color: redColor,
                        ).onTap(() async {
                          await firestore.collection(productsCollection).doc(data[index].id).set(
                            {
                              'p_wishlist': FieldValue.arrayRemove([currentUser!.uid])
                            },
                            SetOptions(merge: true),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
