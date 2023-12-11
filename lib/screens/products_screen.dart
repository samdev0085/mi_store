import 'package:flutter/material.dart';
import 'package:my_store/const.dart';
import 'package:my_store/models/prodcut_model.dart';
import 'package:my_store/services/api_handler.dart';
import 'package:my_store/widgets/product_grid.dart';

class Products_screen extends StatefulWidget {
  const Products_screen({super.key});

  @override
  State<Products_screen> createState() => _Products_screenState();
}

class _Products_screenState extends State<Products_screen> {
  late TextEditingController _searchController;
  List<ProductModel> productsList = [];
  late String searchProduct;

  initializeApi() async {
    final handler = apiHelper();
    productsList = await handler.getProducts();
    setState(() {});
  }

  @override
  void initState() {
    _searchController = TextEditingController();
    searchProduct = '';
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    initializeApi();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    apiHelper helper = apiHelper();
    List<ProductModel> filteredProducts = productsList
        .where((product) => product.title!.toLowerCase().contains(
              searchProduct.toLowerCase(),
            ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white70,
        title: Text(
          'Products',
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
                controller: _searchController,
                decoration: kbarDecoration,
                onChanged: (value) {
                  setState(() {
                    searchProduct = value;
                  });
                },
              ),
            ),
            productsList.isEmpty
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
