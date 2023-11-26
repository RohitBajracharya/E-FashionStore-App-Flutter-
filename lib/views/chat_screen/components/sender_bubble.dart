import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:intl/intl.dart' as intl;

Widget senderBubble(DocumentSnapshot data) {
  var t = data['created_on'] == null ? DateTime.now : data['created_on'].toDate();
  var time = intl.DateFormat("h:mma").format(t);
  return Directionality(
    textDirection: data['uid'] == currentUser!.uid ? TextDirection.rtl : TextDirection.ltr,
    child: Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: data['uid'] == currentUser!.uid ? redColor : darkFontGrey,
        borderRadius: data['uid'] == currentUser!.uid
            ? const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              )
            : const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${data['msg']}",
            style: const TextStyle(
              color: whiteColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            time,
            style: TextStyle(
              color: whiteColor.withOpacity(0.5),
            ),
          ),
        ],
      ),
    ),
  );
}
