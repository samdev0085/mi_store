import 'package:flutter/material.dart';
import 'package:my_store/const.dart';

class DetailsTile extends StatelessWidget {
  const DetailsTile({
    Key? key,
    required this.title,
    required this.details,
    required this.enableRating,
  }) : super(key: key);

  final String title;
  final String details;
  final bool enableRating;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      visualDensity: VisualDensity(vertical: -4),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            '$title:',
            style: kpopins.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          SizedBox(width: 8),
          Flexible(
            child: Text(
              details,
              style: kpopins.copyWith(fontSize: 11, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(width: 5,),
          Visibility(
            visible: enableRating,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [kstar, kstar, kstar, kstar, kstar],
            ),
          ),
        ],
      ),
    );
  }
}
