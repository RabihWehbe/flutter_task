


import 'dart:convert';

import 'package:fluttertask/models/product.dart';
import 'package:http/http.dart';

Future<List<Product>?> getProducts() async{
  List<Product>? products = [];

  try{
        final response = await get(Uri.parse('https://fakestoreapi.com/products'));
        final data = jsonDecode(response.body);
        print(data[0]);
        products = (data as List<dynamic>).map((p) => Product.fromJson(p)).toList();
    }catch(e){
      print(e);
    }

  return products;
}