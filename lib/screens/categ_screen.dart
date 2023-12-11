import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_store/models/category_model.dart';
import 'package:my_store/models/prodcut_model.dart';
import 'package:my_store/services/api_handler.dart';
import 'package:my_store/widgets/cateogry_grid.dart';
import '../const.dart';

class CategorisScreen extends StatefulWidget {
  const CategorisScreen({super.key});

  @override
  State<CategorisScreen> createState() => _CategorisScreenState();
}

class _CategorisScreenState extends State<CategorisScreen> {
  late TextEditingController _searchCont;
  List<CategoryModel> categoriesList = [];
  late String searchCategory;
  List<ProductModel> productsList = [];

  Future<void> getCatgoriesandProdcuts() async {
    final handler = apiHelper();
    categoriesList = await handler.getCategories();
    productsList = await handler.getProducts();
    setState(() {});
  }

  @override
  void initState() {
    _searchCont = TextEditingController();
    searchCategory = '';
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    getCatgoriesandProdcuts();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _searchCont.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> filteredCategories = categoriesList
        .where(
          (categ) => categ.catName!.toLowerCase().contains(
                searchCategory.toLowerCase(),
              ),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kmajorColor),
        centerTitle: true,
        backgroundColor: Colors.white70,
        title: Text(
          'Categories',
          style: kplayFair.copyWith(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: kbarDecoration,
              controller: _searchCont,
              onChanged: (value) {
                setState(() {
                  searchCategory = value;
                });
              },
            ),
          ),
          categoriesList.isEmpty
              ? CircularProgressIndicator()
              : Expanded(
                  child: CategoryGridd(
                  tobuild: filteredCategories,
                  products: productsList,
                ))
        ],
      ),
    );
  }
}
