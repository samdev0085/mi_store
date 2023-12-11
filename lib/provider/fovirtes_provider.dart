import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_store/models/prodcut_model.dart';

class FavoriteProvider extends StateNotifier<List<ProductModel>> {
  FavoriteProvider() : super([]);

  bool toggleFavoriteProduct(ProductModel product) {
    // print('before adding : ${state.length}');
    print(product.title);
    final isfavoriteProduct =
        state.any((element) => element.title == product.title);
    // print('isFavorite : $isfavoriteProduct');
    if (isfavoriteProduct) {
      state = state.where((p) => p.title != product.title).toList();
      // print('after removing : ${state.length}');
      return false;
    } else {
      state = [...state, product];
      print(state.length);
      return true;
    }
  }
}

final favProvider = StateNotifierProvider<FavoriteProvider, List<ProductModel>>(
    (ref) => FavoriteProvider());
