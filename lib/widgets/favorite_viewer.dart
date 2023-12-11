import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_store/provider/fovirtes_provider.dart';

import '../models/prodcut_model.dart';
import 'favorite_tile.dart';

class FavViewer extends ConsumerWidget {
  const FavViewer({super.key, required this.filteredProducts});
  final List<ProductModel> filteredProducts;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    removeFavorite(ProductModel product) {
      ref.read(favProvider.notifier).toggleFavoriteProduct(product);
    }

    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          final product = filteredProducts[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Dismissible(
              background: Container(
                alignment: Alignment.centerRight,
                color: Colors.red,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              onDismissed: (value) {
                removeFavorite(product);
              },
              key: ValueKey(product.id),
              child: Container(
                height: 80,
                child: FavoriteProduct(
                  productImage: product.image!,
                  title: product.title!,
                  price: product.price.toString(),
                  ratings: product.rating.toString(),
                ),
              ),
            ),
          );
        });
  }
}
