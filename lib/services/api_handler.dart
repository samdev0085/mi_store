import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_store/models/category_model.dart';
import 'package:my_store/models/prodcut_model.dart';

class apiHelper {
  Future<List<ProductModel>> getProducts() async {
    //fetching the products from API
    var response =
        await http.get(Uri.parse('https://dummyjson.com/products?limit=100'));
    Map<String, dynamic> jsonDataMap = jsonDecode(response.body);

    List<dynamic> products = jsonDataMap['products'];
    return ProductModel.getProductsfromapi(products);
  }

  Future<List<CategoryModel>> getCategories() async {
    //To fetch categories
    var response =
        await http.get(Uri.parse('https://dummyjson.com/products/categories'));
    List<dynamic> categories = jsonDecode(response.body);

    return categories.map((cat) {
      String categoryName = cat.toString();
      return CategoryModel(
        image: categoriesImagesBank[categoryName] ?? 'default_image_path',
        catName: categoryName,
      );
    }).toList();
  }
}

Map<String, String> categoriesImagesBank = {
  //static images for categories
  'smartphones': 'assets/categories/smartphones.jpeg',
  'laptops': 'assets/categories/laptop.jpeg',
  'fragrances': 'assets/categories/ragrances.jpg',
  'skincare': 'assets/categories/sikincare.jpg',
  'groceries': 'assets/categories/grocries.jpg',
  'home-decoration': 'assets/categories/home dec.jpeg',
  'furniture': 'assets/categories/furniture.jpeg',
  'tops': 'assets/categories/tops.jpeg',
  'womens-dresses': 'assets/categories/women dresses.jpeg',
  'womens-shoes': 'assets/categories/women shoes.jpeg',
  'mens-shirts': 'assets/categories/mens shirts.jpeg',
  'mens-shoes': 'assets/categories/men shoes.jpeg',
  'mens-watches': 'assets/categories/men watches.jpeg',
  'womens-watches': 'assets/categories/women wathces.jpeg',
  'womens-bags': 'assets/categories/women bags.jpeg',
  'womens-jewellery': 'assets/categories/jwels.jpeg',
  'sunglasses': 'assets/categories/sunglasses.jpeg',
  'automotive': 'assets/categories/automotve.jpeg',
  'motorcycle': 'assets/categories/motorcycle.jpeg',
  'lighting': 'assets/categories/lighting.jpeg',
};
