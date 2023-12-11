import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_store/provider/fovirtes_provider.dart';
import 'package:my_store/widgets/favorite_viewer.dart';

import '../const.dart';
import '../models/prodcut_model.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  late TextEditingController _searchCont;
  late String searchText;
  @override
  void initState() {
    _searchCont = TextEditingController();
    searchText = '';
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
    final favorites = ref.watch(favProvider);
    List<ProductModel> allFavorites = [...favorites];
    List<ProductModel> filteredProducts = allFavorites
        .where((product) =>
            product.title!.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white70,
        title: Text(
          'Favorites',
          style: kplayFair.copyWith(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: _searchCont,
              decoration: kbarDecoration,
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
          ),
          favorites.isEmpty
              ? Center(child: Text('Uh\' oh, There is nothing your favorite  '))
              : Expanded(child: FavViewer(filteredProducts: filteredProducts))
        ],
      ),
    );
  }
}
