import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/common_widgets/loading_indicator.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/controller/chats_controller.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/views/chat_screen/components/sender_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var chatController = Get.put(ChatsController());

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text(
          "${chatController.friendName}",
          style: const TextStyle(
            fontFamily: semibold,
            color: darkFontGrey,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(
              () => chatController.isLoading.value
                  ? Center(child: loadingIndicator())
                  : Expanded(
                      child: StreamBuilder(
                        stream: FiresstoreServices.getChatMessages(chatController.chatDocId.toString()),
                        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: loadingIndicator());
                          } else if (snapshot.data!.docs.isEmpty) {
                            return const Center(
                              child: Text(
                                "Send a message...",
                                style: TextStyle(color: darkFontGrey),
                              ),
                            );
                          } else {
                            return ListView(
                              children: snapshot.data!.docs.mapIndexed((currentValue, index) {
                                var data = snapshot.data!.docs[index];
                                return Align(
                                  alignment: data['uid'] == currentUser!.uid ? Alignment.centerRight : Alignment.centerLeft,
                                  child: senderBubble(data),
                                );
                              }).toList(),
                            );
                          }
                        },
                      ),
                    ),
            ),
            const SizedBox(height: 10),
            //message box
            messageBox(chatController).box.height(80).padding(const EdgeInsets.all(12)).margin(const EdgeInsets.only(bottom: 8.0)).make(),
          ],
        ),
      ),
    );
  }

  //message box
  Widget messageBox(chatController) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: chatController.msgController,
            decoration: const InputDecoration(
              hintText: "Type a message...",
              border: OutlineInputBorder(
                borderSide: BorderSide(color: textfieldGrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: textfieldGrey),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            chatController.sendMsg(chatController.msgController.text);
            chatController.msgController.clear();
          },
          icon: const Icon(
            Icons.send,
            color: redColor,
          ),
        ),
      ],
    );
  }
}
