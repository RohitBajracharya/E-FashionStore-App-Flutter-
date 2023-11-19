// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'dart:io';

import 'package:ecommerce_app/common_widgets/bg_widget.dart';
import 'package:ecommerce_app/common_widgets/custom_textfield.dart';
import 'package:ecommerce_app/common_widgets/our_button.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/controller/profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profileController = Get.find<ProfileController>();

    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //user image
            data['imageUrl'] == '' && profileController.profileImagePath.isEmpty
                ? Image.asset(
                    imgProfile2,
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make()
                : data['imageUrl'] != '' && profileController.profileImagePath.isEmpty
                    ? Image.network(
                        data['imageUrl'],
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : Image.file(
                        File(profileController.profileImagePath.value),
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
            const SizedBox(height: 10),
            ourButton(
              color: redColor,
              onPress: () {
                profileController.changeImage(context);
              },
              textColor: whiteColor,
              title: "Change",
            ),
            const Divider(),
            const SizedBox(height: 20),
            //name textfield
            customTextField(
              hint: nameHint,
              title: name,
              isPass: false,
              controller: profileController.nameController,
            ),
            const SizedBox(height: 10),

            //old password textfield
            customTextField(
              hint: passwordHint,
              title: oldpass,
              isPass: true,
              controller: profileController.oldpasswordController,
            ),
            const SizedBox(height: 10),

            //password textfield
            customTextField(
              hint: passwordHint,
              title: newpass,
              isPass: true,
              controller: profileController.newpasswordController,
            ),

            const SizedBox(height: 10),
            profileController.isLoading.value
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  )
                : SizedBox(
                    width: screenWidth - 60,
                    child: ourButton(
                        color: redColor,
                        onPress: () async {
                          profileController.isLoading(true);
                          //if image is not selected
                          if (profileController.profileImagePath.value.isNotEmpty) {
                            await profileController.uploadProfileImage();
                          } else {
                            profileController.profileImageLink = data['imageUrl'];
                          }
                          //if old password matches database
                          if (data['password'] == profileController.oldpasswordController.text) {
                            await profileController.changeAuthPassword(
                              email: data['email'],
                              password: profileController.oldpasswordController.text,
                              newpassword: profileController.newpasswordController.text,
                            );
                            await profileController.updateProfile(
                              imgUrl: profileController.profileImageLink,
                              name: profileController.nameController.text,
                              password: profileController.newpasswordController.text,
                            );
                            VxToast.show(context, msg: "Updated");
                            Get.back();
                          } else {
                            VxToast.show(context, msg: "Wrong old password");
                            profileController.isLoading(false);
                          }
                        },
                        textColor: whiteColor,
                        title: "Save"),
                  ),
          ],
        )
            .box
            .white
            .shadowSm
            .padding(const EdgeInsets.all(16))
            .margin(const EdgeInsets.only(
              top: 50,
              left: 12,
              right: 12,
            ))
            .rounded
            .make(),
      ),
    ));
  }
}
