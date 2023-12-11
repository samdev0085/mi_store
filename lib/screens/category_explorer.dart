import 'package:flutter/material.dart';

import '../const.dart';
import '../models/prodcut_model.dart';
import '../widgets/product_grid.dart';

class ProductsFilterScreen extends StatefulWidget {
  const ProductsFilterScreen(
      {super.key, required this.products, required this.category});
  final List<ProductModel> products;
  final String category;
  @override
  State<ProductsFilterScreen> createState() => _ProductsFilterScreenState();
}

class _ProductsFilterScreenState extends State<ProductsFilterScreen> {
  late TextEditingController _searchCont;
  late String searchProduct;
  @override
  void initState() {
    searchProduct = '';
    _searchCont = TextEditingController();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _searchCont.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    List<ProductModel> filteredProducts = widget.products
        .where((product) =>
            product.title!.toLowerCase().contains(searchProduct.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kmajorColor),
        centerTitle: true,
        backgroundColor: Colors.white70,
        title: Text(
          widget.category,
          style: kplayFair.copyWith(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: _searchCont,
                decoration: kbarDecoration,
                onChanged: (value) {
                  setState(() {
                    searchProduct = value;
                  });
                },
              ),
            ),
            widget.products.isEmpty
                ? CircularProgressIndicator()
                : Expanded(
                    child: ProductViewer(tobuild: filteredProducts),
                  ),
          ],
        ),
      ),
    );
  }
}
