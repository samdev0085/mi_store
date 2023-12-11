import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_store/const.dart';

class Category_card extends StatelessWidget {
  const Category_card(
      {super.key,
      required this.title,
      required this.image,
      required this.onTap});
  final String title, image;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 140,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      image,
                    ))),
          ),
        ),
        Positioned(
            top: 9,
            left: 10,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: kpopins.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 12),
            )),
      ],
    );
  }
}
