


import 'package:flutter/cupertino.dart';
import 'package:fluttertask/services/getproducts.dart';

import '../models/product.dart';

class ProductData extends ChangeNotifier{

  List<Product>? products = [];

  bool loadingProducts = false;


  Future<void> getProductData() async{
    loadingProducts = true;
    products = await getProducts();

    print(products);
    loadingProducts = false;
    notifyListeners();
  }
}