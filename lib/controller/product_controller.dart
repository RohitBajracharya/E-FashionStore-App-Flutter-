import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:flutter/services.dart';

class ProductController extends GetxController {
  var subCat = [];

  getSubCategories(title) async {
    subCat.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoryModelFromJson(data);
    var s = decoded.categories.where((element) => element.name == title).toList();
    for (var e in s[0].subcategory) {
      subCat.add(e);
    }
  }
}
