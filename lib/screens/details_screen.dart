import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_store/const.dart';
import 'package:my_store/models/prodcut_model.dart';
import 'package:my_store/provider/fovirtes_provider.dart';
import 'package:my_store/widgets/details_tile.dart';

class DetailsScreen extends ConsumerWidget {
  const DetailsScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final favroiteProduct = ref.watch(favProvider);

    bool isfavorite =
        favroiteProduct.any((element) => element.title == product.title);
    print(isfavorite);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Product Details',
          style: kplayFair.copyWith(fontSize: 24, color: kmajorColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FancyShimmerImage(
                height: 200, width: double.infinity, imageUrl: product.image!),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: Text(
                      'Product Details :',
                      style: kpopins.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        bool value = ref
                            .read(favProvider.notifier)
                            .toggleFavoriteProduct(product);
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(value
                                ? 'Prodcut is added to Favorites'
                                : 'Product is no longer your Favorite'),
                          ),
                        );
                      },
                      icon: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) {
                          return SizeTransition(
                              sizeFactor: Tween(begin: 0.4, end: 1.0)
                                  .animate(animation),
                              child: child);
                        },
                        child: Icon(
                          !isfavorite
                              ? FontAwesomeIcons.heart
                              : FontAwesomeIcons.solidHeart,
                          color: Colors.red,
                          key: ValueKey(isfavorite),
                        ),
                      ),
                    ),
                  ),
                  DetailsTile(
                    title: 'Name',
                    details: product.title!,
                    enableRating: false,
                  ),
                  DetailsTile(
                    title: 'Price',
                    details: product.price.toString(),
                    enableRating: false,
                  ),
                  DetailsTile(
                    title: 'Category',
                    details: product.category!,
                    enableRating: false,
                  ),
                  DetailsTile(
                    title: 'Brand',
                    details: product.brand!,
                    enableRating: false,
                  ),
                  DetailsTile(
                    title: 'Rating',
                    details: product.rating.toString(),
                    enableRating: true,
                  ),
                  DetailsTile(
                    title: 'Stock',
                    details: product.stock.toString(),
                    enableRating: false,
                  ),
                  DetailsTile(
                    title: 'Description',
                    details: '',
                    enableRating: false,
                  ),
                  Text(product.description!),
                  DetailsTile(
                    title: 'Product Gallery',
                    details: '',
                    enableRating: false,
                  ),
                  MasonryView(
                      listOfItem: product.snaps,
                      numberOfColumn: 2,
                      itemBuilder: (url) =>
                          FancyShimmerImage(height: 150, imageUrl: url)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
