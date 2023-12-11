import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
  });
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 50),
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(title),
    );
  }
}