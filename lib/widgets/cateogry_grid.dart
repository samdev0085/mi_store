import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_store/models/prodcut_model.dart';
import 'package:my_store/screens/category_explorer.dart';
import 'package:my_store/widgets/category.dart';

import '../models/category_model.dart';

class CategoryGridd extends StatelessWidget {
  const CategoryGridd(
      {super.key, required this.tobuild, required this.products});
  final List<CategoryModel> tobuild;
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    String capitalize(String input) {
      return input.isNotEmpty
          ? input[0].toUpperCase() + input.substring(1)
          : input;
    }

    void navigate(String category) {
      List<ProductModel> filteredProducts = products
          .where((p) => p.category!.toLowerCase() == category.toLowerCase())
          .toList();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductsFilterScreen(
                  products: filteredProducts, category: category)));
    }

    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 23),
        itemCount: tobuild.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 12),
        itemBuilder: (context, index) => Category_card(
              title: capitalize(tobuild[index].catName!),
              image: tobuild[index].image,
              onTap: () {
                navigate(capitalize(tobuild[index].catName!));
              },
            ));
  }
}
