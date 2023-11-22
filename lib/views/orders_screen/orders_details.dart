// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/views/orders_screen/components/order_place_details.dart';
import 'package:ecommerce_app/views/orders_screen/components/order_status.dart';
import 'package:intl/intl.dart' as intl;

class OrderDetails extends StatelessWidget {
  final dynamic data;
  const OrderDetails({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Orders Details".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Column(
                children: [
                  //order status section
                  orderStatusSection(),
                  const Divider(),
                  10.heightBox,
                  //order place details section
                  Column(
                    children: [
                      orderPlaceDetailsSection(),
                      //shipping address and total amount section
                      shippingAddressNamountSection(),
                    ],
                  ).box.outerShadowMd.white.make(),
                  const Divider(),
                  10.heightBox,
                  //ordered products
                  orderedProductsSection(),
                  20.heightBox,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //ordered products
  Widget orderedProductsSection() {
    return Column(
      children: [
        "Ordered Product".text.size(16).fontFamily(semibold).color(darkFontGrey).makeCentered(),
        10.heightBox,
        ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: List.generate(data['orders'].length, (index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                orderPlaceDetails(
                  title1: data['orders'][index]['title'],
                  title2: "Rs. ${data['orders'][index]['total_price']}",
                  d1: "${data['orders'][index]['quantity']}*",
                  d2: "Refundable",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: 40,
                    height: 20,
                    color: Color(data['orders'][index]['color']),
                  ),
                ),
                const Divider(),
              ],
            );
          }).toList(),
        ).box.outerShadowMd.white.margin(const EdgeInsets.only(bottom: 4)).make(),
      ],
    );
  }

  //shipping address and total amount section
  Widget shippingAddressNamountSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Shipping Address".text.fontFamily(semibold).make(),
              "${data['order_by_name']}".text.make(),
              "${data['order_by_email']}".text.make(),
              "${data['order_by_address']}".text.make(),
              "${data['order_by_city']}".text.make(),
              "${data['order_by_state']}".text.make(),
              "${data['order_by_phone']}".text.make(),
            ],
          ),
          SizedBox(
            width: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Total Amount".text.fontFamily(semibold).make(),
                "Rs. ${data['total_amount']}".text.color(redColor).fontFamily(bold).make(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //order place details section
  Widget orderPlaceDetailsSection() {
    return Column(
      children: [
        orderPlaceDetails(
          d1: data['order_code'],
          d2: data['shipping_method'],
          title1: "Order Code",
          title2: "Shipping Method",
        ),
        orderPlaceDetails(
          d1: intl.DateFormat().add_yMd().format((data['order_date'].toDate())),
          d2: data['payment_method'],
          title1: "Order Date",
          title2: "Payment Method",
        ),
        orderPlaceDetails(
          d1: "Unpaid",
          d2: "Order Placed",
          title1: "Payment Status",
          title2: "Delivery Status",
        ),
      ],
    );
  }

  //order status section
  Widget orderStatusSection() {
    return Column(
      children: [
        orderStatus(
          color: redColor,
          icon: Icons.done,
          title: "Placed",
          showDone: data['order_placed'],
        ),
        orderStatus(
          color: Colors.blue,
          icon: Icons.thumb_up,
          title: "Confirmed",
          showDone: data['order_confirmed'],
        ),
        orderStatus(
          color: Colors.yellow,
          icon: Icons.car_crash,
          title: "On Delivery",
          showDone: data['order_on_delivery'],
        ),
        orderStatus(
          color: Colors.purple,
          icon: Icons.done_all_rounded,
          title: "Delivered",
          showDone: data['order_delivered'],
        ),
      ],
    );
  }
}
