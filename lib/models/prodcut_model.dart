class ProductModel {
  String? image, title, description, brand, category;
  double? rating;
  int? price, stock, id;
  late List<dynamic> snaps;

  ProductModel(
      {this.image,
      this.title,
      this.rating,
      this.price,
      this.brand,
      this.category,
      this.description,
        this.id,
      this.stock,
      required this.snaps});

  ProductModel.fromJSON(Map<String, dynamic> json) {
    image = json['thumbnail'];
    title = json['title'];
    rating = (json['rating'] as num?)?.toDouble();
    price = json['price'];
    brand = json['brand'];
    category = json['category'];
    description = json['description'];
    brand = json['brand'];
    snaps = json['images'];
    stock = json['stock'];
    id = json['id'];
  }

  static List<ProductModel> getProductsfromapi(List snapshots) {
    // print(snapshots[3]);
    return snapshots.map((product) {
      return ProductModel.fromJSON(product);
    }).toList();
  }
}
