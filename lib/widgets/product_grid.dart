import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_store/screens/details_screen.dart';
import 'package:my_store/widgets/product_widget.dart';

import '../models/prodcut_model.dart';

class ProductViewer extends StatelessWidget {
  const ProductViewer({super.key, required this.tobuild});
  final List<ProductModel> tobuild;
  @override
  Widget build(BuildContext context) {
    void navigate(product) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsScreen(product: product)));
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 23),
      itemCount: tobuild.length,
      itemBuilder: (context, index) {
        final product = tobuild[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Product(
            productImage: product.image!,
            title: product.title!,
            rating: product.rating.toString(),
            price: product.price.toString(),
            supplier: product.brand!,
            category: product.category!,
            onTap: () {
              navigate(product);
            },
          ),
        );
      },
    );
  }
}
