import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/views/cart_screen/cart_screen.dart';
import 'package:ecommerce_app/views/category_screen/category_screen.dart';
import 'package:ecommerce_app/views/home_screen/home_screen.dart';
import 'package:ecommerce_app/views/profile_screen/profile_screen.dart';

const socialIconList = [icFacebookLogo, icGoogleLogo, icTwitterLogo];

//bottom navigation bar items list
var navbarItem = [
  BottomNavigationBarItem(
      icon: Image.asset(
        icHome,
        width: 26,
      ),
      label: home),
  BottomNavigationBarItem(
    icon: Image.asset(
      icCategories,
      width: 26,
    ),
    label: categories,
  ),
  BottomNavigationBarItem(
    icon: Image.asset(
      icCart,
      width: 26,
    ),
    label: cart,
  ),
  BottomNavigationBarItem(
    icon: Image.asset(
      icProfile,
      width: 26,
    ),
    label: account,
  )
];

//nav body list
var navBody = [
  const HomeScreen(),
  const CategoryScreen(),
  const CartScreen(),
  const ProfileScreen(),
];

//brand list
const slidersList = [imgSlider1, imgSlider2, imgSlider3, imgSlider4];

const secondSlidersList = [imgSs1, imgSs2, imgSs3, imgSs4];

//featured categories images and titles list
const featuredImages1 = [imgS1, imgS3, imgS5];
const featuredImages2 = [imgS2, imgS4, imgS7];
const featuresTitles1 = [shirts, jackets, coats];
const featuresTitles2 = [pants, shorts, footwear];

//categories list
const categoriesList = [shirts, pants, jackets, shorts, coats, accessories, footwear];
const categoriesImages = [imgS1, imgS2, imgS3, imgS4, imgS5, imgS6, imgS7];
const itemDetailButtonList = [video, reviews, privacyPolicy, returnPolicy, supportPolicy];

//profile button list
const profileButtonsList = [orders, wishlist, messages];
const profileButtonsIcon = [icOrders, icWishlist, icMessages];

//payment method
const paymentMethodsImg = [imgPaypal, imgKhalti, imgCod];
const paymentMethods = [paypal, khalti, cod];
