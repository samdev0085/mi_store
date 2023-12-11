import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:my_store/const.dart';

class Product extends StatelessWidget {
  const Product(
      {super.key,
      required this.productImage,
      required this.title,
      required this.rating,
      required this.price,
      required this.supplier,
      required this.category,
      required this.onTap});
  final String productImage, title, rating, category, price, supplier;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width * 0.80,
        child: Column(
          children: [
            FancyShimmerImage(
              height: 140,
              imageUrl: productImage,
              boxFit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: kpopins.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 2),
                          Row(
                            children: [
                              Text(
                                rating,
                                style: kpopins.copyWith(
                                    fontWeight: FontWeight.w600, fontSize: 10),
                              ),
                              SizedBox(width: 3,),
                              kstar,
                              kstar,
                              kstar,
                              kstar,
                              kstar
                            ],
                          ),
                          SizedBox(height: 2),
                          Text(
                            supplier,
                            style: kpopins.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                                color: Colors.black54),
                          ),
                          Text(
                            category,
                            style: kpopins.copyWith(
                                fontSize: 10, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '\$$price',
                      style: kpopins.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
