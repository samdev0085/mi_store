import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_store/const.dart';

class FavoriteProduct extends StatelessWidget {
  const FavoriteProduct({
    super.key,
    required this.productImage,
    required this.title,
    required this.price,
    required this.ratings,
  });
  final String productImage, title, price, ratings;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      contentPadding: EdgeInsets.all(8),
      leading: SizedBox(
        height: 70,
        width: 70,
        child: CircleAvatar(
          backgroundImage: NetworkImage(productImage),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: kpopins.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Text('\$$price',
              style:
                  kpopins.copyWith(fontSize: 11, fontWeight: FontWeight.w600)),
          Row(
            children: [
              Text(ratings,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: kpopins.copyWith(
                      fontSize: 11, fontWeight: FontWeight.w600)),
              SizedBox(
                width: 2,
              ),
              kstar,
              kstar,
              kstar
            ],
          ),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          FontAwesomeIcons.solidHeart,
          color: Colors.red,
        ),
        onPressed: () {},
      ),
    );
  }
}
