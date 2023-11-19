import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/auth/login_screen.dart';
import 'package:ecommerce_app/common_widgets/bg_widget.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/controller/auth_controller.dart';
import 'package:ecommerce_app/controller/profile_controller.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/views/profile_screen/components/details_card.dart';
import 'package:ecommerce_app/views/profile_screen/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var profileController = Get.put(ProfileController());

    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
          stream: FiresstoreServices.getUser(currentUser!.uid),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else {
              var data = snapshot.data!.docs[0];
              return SafeArea(
                child: Column(
                  children: [
                    //edit profile button
                    editProfileButton(data, profileController),
                    //user detail section
                    userDetailSection(data),
                    const SizedBox(height: 20),
                    //detail card section
                    detailCardSection(data),
                    //buttons section
                    buttonsSection(),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  //buttons section
  Widget buttonsSection() {
    return Container(
      color: redColor,
      child: Container(
        margin: const EdgeInsets.all(12.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color with opacity
              blurRadius: 4.0, // Spread of the shadow
              offset: const Offset(0, 2), // Offset in the x, y direction
            ),
          ],
        ),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return const Divider(color: lightGrey);
          },
          itemCount: profileButtonsList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset(profileButtonsIcon[index], width: 22),
              title: Text(
                profileButtonsList[index],
                style: const TextStyle(
                  fontFamily: semibold,
                  color: darkFontGrey,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  //detail card section
  Widget detailCardSection(data) {
    return Container(
      color: redColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          detailsCard(count: data['cart_count'], title: "in your cart"),
          detailsCard(count: data['wishlist_count'], title: "in your wishlist"),
          detailsCard(count: data['order_count'], title: "in your orders"),
        ],
      ),
    );
  }

  //user detail section
  Widget userDetailSection(data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          //user image
          data['imageUrl'] == ''
              ? Image.asset(
                  imgProfile2,
                  width: 100,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make()
              : Image.network(
                  data['imageUrl'],
                  width: 100,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make(),
          const SizedBox(width: 10),
          // user name and email
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //user name
                Text(
                  data['name'].toString(),
                  style: const TextStyle(fontFamily: semibold, color: Colors.white),
                ),
                //user email
                Text(
                  data['email'].toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          //logout button
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: whiteColor),
            ),
            onPressed: () async {
              await Get.put(AuthController().signout(Get.context));
              Get.offAll(() => const LoginScreen());
            },
            child: const Text(
              logout,
              style: TextStyle(fontFamily: semibold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  //edit profile button
  Widget editProfileButton(dynamic data, profileController) {
    return InkWell(
      onTap: () {
        profileController.nameController.text = data['name'];
        profileController.passwordController.text = data['password'];
        Get.to(() => EditProfileScreen(data: data));
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.topRight,
          child: Icon(
            Icons.edit,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
