import 'package:ecommerce_app/consts/consts.dart';

class FiresstoreServices {
  //get users data
  static getUser(uid) {
    return firestore.collection(usersCollection).where('id', isEqualTo: uid).snapshots();
  }

  //gets products according to category
  static getProducts(category) {
    return firestore.collection(productsCollection).where("p_category", isEqualTo: category).snapshots();
  }
}
