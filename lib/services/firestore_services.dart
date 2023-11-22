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

  //get cart
  static getCart(uid) {
    return firestore.collection(cartCollection).where('added_by', isEqualTo: uid).snapshots();
  }

  //delete cartitem
  static deleteCartItem(docId) {
    return firestore.collection(cartCollection).doc(docId).delete();
  }

  //get all chat messages
  static getChatMessages(docId) {
    return firestore.collection(chatsCollection).doc(docId).collection(messagesCollection).orderBy('created_on', descending: false).snapshots();
  }

  //get all orders of one users
  static getAllOrders() {
    return firestore.collection(ordersCollection).where('order_by', isEqualTo: currentUser!.uid).snapshots();
  }

  //get all wishlist
  static getWishlists() {
    return firestore.collection(productsCollection).where('p_wishlist', arrayContains: currentUser!.uid).snapshots();
  }

  //get all messages
  static getAllMessages() {
    return firestore.collection(chatsCollection).where('fromId', isEqualTo: currentUser!.uid).snapshots();
  }

  //get orders,carts,wishlist count
  static getCounts() async {
    var res = await Future.wait([
      firestore.collection(cartCollection).where('added_by', isEqualTo: currentUser!.uid).get().then((value) {
        return value.docs.length;
      }),
      firestore.collection(productsCollection).where('p_wishlist', arrayContains: currentUser!.uid).get().then((value) {
        return value.docs.length;
      }),
      firestore.collection(ordersCollection).where('order_by', isEqualTo: currentUser!.uid).get().then((value) {
        return value.docs.length;
      }),
    ]);
    return res;
  }

  //gets products
  static getAllProducts() {
    return firestore.collection(productsCollection).snapshots();
  }

  //get featured products
  static getFeaturedProducts() {
    return firestore.collection(productsCollection).where('is_featured', isEqualTo: true).get();
  }

  //get search products
  static searchProducts(title) {
    return firestore.collection(productsCollection).get();
  }

  //get subcategory products
  static getSubCategoryProducts(title) {
    return firestore.collection(productsCollection).where('p_subcategory',isEqualTo: title).snapshots();
  }
}
