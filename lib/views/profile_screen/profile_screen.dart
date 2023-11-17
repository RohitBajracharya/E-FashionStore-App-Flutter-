import 'package:ecommerce_app/common_widgets/bg_widget.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/views/profile_screen/components/details_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              //edit profile button
              editProfileButton(),
              //user detail section
              userDetailSection(),
              const SizedBox(height: 20),
              //detail card section
              detailCardSection(),
              //buttons section
              buttonsSection(),
            ],
          ),
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
              offset: Offset(0, 2), // Offset in the x, y direction
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
  Widget detailCardSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        detailsCard(count: "00", title: "in your cart"),
        detailsCard(count: "32", title: "in your wishlist"),
        detailsCard(count: "675", title: "in your orders"),
      ],
    );
  }

  //user detail section
  Widget userDetailSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          //user image
          Image.asset(
            imgProfile2,
            width: 100,
            fit: BoxFit.cover,
          ).box.roundedFull.clip(Clip.antiAlias).make(),
          const SizedBox(width: 10),
          // user name and email
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //user name
                Text(
                  "Dummy User",
                  style: TextStyle(fontFamily: semibold, color: Colors.white),
                ),
                //user email
                Text(
                  "customer@example.com",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          //logout button
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: whiteColor),
            ),
            onPressed: () {},
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
  Widget editProfileButton() {
    return InkWell(
      onTap: () {},
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
